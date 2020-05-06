class ScriptsController < ApplicationController
  before_action :set_script, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /scripts
  # GET /scripts.json
  def index
    @scripts = Script.all
  end

  # GET /scripts/1
  # GET /scripts/1.json
  def show
  end

  # GET /scripts/new
  def new
    @script = Script.new
  end

  # GET /scripts/1/edit
  def edit
  end

  # POST /scripts
  # POST /scripts.json
  def create
    if user_has_permision
    @script = Script.new(script_params)
    respond_to do |format|
      if @script.save
        format.html { redirect_to @script, notice: 'Script was successfully created.' }
        format.json { render :show, status: :created, location: @script }
      else
        format.html { render :new }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to scripts_path
      flash[:alert] = "You need to be an admin to create a script"
    end
  end

  # PATCH/PUT /scripts/1
  # PATCH/PUT /scripts/1.json
  def update
    if user_has_permision
      respond_to do |format|
        if @script.update(script_params)
          format.html { redirect_to @script, notice: 'Script was successfully updated.' }
          format.json { render :show, status: :ok, location: @script }
        else
          format.html { render :edit }
          format.json { render json: @script.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to scripts_path
     flash[:alert] = "You need to be an admin to edit a script"
    end
  end

  # DELETE /scripts/1
  # DELETE /scripts/1.json
  def destroy
    if user_has_permision
      @script.destroy
      respond_to do |format|
        format.html { redirect_to scripts_url, notice: 'Script was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to scripts_path
      flash[:alert] = "You need to be an admin to delete scripts"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script
      @script = Script.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def script_params
      params.require(:script).permit(:user_id, :details, :expiration, :doctor)
    end

    def user_has_permision
      current_user.has_role? :admin
    end
  
end
