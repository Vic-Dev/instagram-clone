class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :full_name, :username, :password, :password_confirmation)
  end
end
