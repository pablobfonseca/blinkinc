class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    return admin_users_path if resource.is_a?(AdminUser)
    root_path
  end
end
