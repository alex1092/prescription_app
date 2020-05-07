class PagesController < ApplicationController
  before_action :set_up_profile , only: [:index]

  def index
    
  end



private 

def set_up_profile
  if current_user && !current_user.has_role?(:admin)
    if !current_user.phone || !current_user.dob  || !current_user.address
      redirect_to edit_user_registration_path(current_user.id)
    end
  end
end

end
