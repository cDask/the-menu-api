class UsersController < ApplicationController
  def create
    User.create(user_params)
    render json: 'user created', status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end
