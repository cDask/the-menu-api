class UsersController < ApplicationController
  before_action :authenticate_user, only: [:update]
  before_action :find_user, only: [:update]

  def create
    user = User.new(user_params)
    if user.save
      render json: 'user created', status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: { user: {
        id: current_user.id,
        email: current_user.email,
        full_name: current_user.full_name
      } }, status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end
