class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        redirect_to root_url, :notice => "Signed Up!"
      else
        render "new"
      end
    else
      flas[:error] ="There was an error with the recaptcha code bello. Please re-enter the code and click submit."
      render"new"
    end
  end

end
