class UsersController < ApplicationController
  def contact
  end 
  def show
    @user = User.find_by(name: params[:name])
  end
  def new
    if logged_in?
      redirect_to root_path
    else
    @user = User.new
  end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome!"
      redirect_to profile_path_url(@user.name)
    else
      render 'new'
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation )
  end
end
