class UsersController < ApplicationController
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        rc :notice => "Signed Up!"
      else
          render "new"
      end
    else
      flash[:error] = "There was an error with the recaptcha code below.
                     Please re-enter the code and click submit."
      render "new"
    end
  end


  def your_acount
    user=User.find_by_email(current_user.email)
    unless @user.id == user.id || current_user.is_admin
    flash[:notice]="this is not admin Account"
    redirect_to users_path
    end
  end
end

