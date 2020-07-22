class RestaurantsController < ApplicationController
  before_action :authenticate_user
  def index
    restaurants = current_user.restaurants
    render json: restaurants
  end
end
