class RestaurantsController < ApplicationController
  before_action :authenticate_user
  def index
    restaurants = current_user.restaurants
    render json: { restaurants: restaurants }, status: :ok
  end

  def create
    restaurant = current_user.restaurants.new(restaurant_params)
    if restaurant.save
      render json: {}, status: :created
    else
      render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :subdomain, :opening_hours)
  end
end
