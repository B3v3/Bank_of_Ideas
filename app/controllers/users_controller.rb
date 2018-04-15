class UsersController < ApplicationController
  def show
    @user = User.find_by(name: params[:name])
  end
  def new
    @user = User.new
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

  def destroy
    @user =  User.find_by(name: params[:name])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation )
  end
end
