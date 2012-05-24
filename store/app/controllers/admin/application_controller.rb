class Admin::ApplicationController < ApplicationController
  protect_from_forgery

  def require_admin_login
     if current_user.nil? || !current_user.is_admin?
       flash[:error] = "Only admins are permitted"
       redirect_to log_in_path
    else
       return current_user
    end
  end

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin
    if current_user.email == "fenrirzzzzz@gmail.com"
      true
    else
      false
    end
  end
end
