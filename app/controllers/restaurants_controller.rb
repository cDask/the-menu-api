class RestaurantsController < ApplicationController
  before_action :authenticate_user, except: [:show]
  before_action :set_restaurant, only: %i[update destroy]

  def index
    @restaurants = current_user.restaurants.includes(:contact_infos, :theme, :style, menus: [:items])
  end

  def show
    @restaurant = Restaurant.find_by(subdomain: params[:subdomain])
  end

  def create
    restaurant = current_user.restaurants.new(restaurant_params)
    if restaurant.save
      render json: restaurant, status: :created
    else
      render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @restaurant.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    render json: {}, status: :no_content
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :subdomain, :opening_hours)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
