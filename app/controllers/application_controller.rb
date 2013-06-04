class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    #request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    if resource.sign_in_count <= 3
      #lets guide the user to add characters
      new_character_path
    else
      root_path
    end
  end
end
