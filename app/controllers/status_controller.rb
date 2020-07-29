class StatusController < ApplicationController
  before_action :authenticate_user

  def index
    render json: { message: 'logged in' }
  end

  def user
    render json: { user: { id: current_user.id, email: current_user.email, full_name: current_user.full_name } }
  end
end
