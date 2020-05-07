class RegistrationsController < Devise::RegistrationsController
    
    # POST /resource
    def create
      super
      if params[:user][:key] == "doctor"
        resource.add_role(:admin)
      end
    end
  
end