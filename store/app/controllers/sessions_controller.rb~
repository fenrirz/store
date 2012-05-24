class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
        session[:user_id] = user.id
        redirect_to articles_path, :notice => "Logged In!"
    else
        flash.now.alert="Invalid Email or Password"
        render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to new_session_path :notice => "Logged Out!"
  end
end
