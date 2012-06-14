class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save 
        redirect_to root_url, :notice => "Signed up!" 
      else
        render "new" 
      end
    else
      flash[:error] = "There was an error with the recaptcha code below.
                     Please re-enter the code and click submit."
      render "new"
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile has been update"
      redirect_to user_path
    else
      flash[:notice] = "Profile can not be update"
      redirect_to :edit
    end
  end

  def show
    @user = User.find_by_id(params[:id])  
  end


end
