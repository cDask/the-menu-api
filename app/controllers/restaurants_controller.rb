class RestaurantsController < ApplicationController
  before_action :authenticate_user
  before_action :set_restaurant, only: %i[update]

  def index
    restaurants = current_user.restaurants.includes(:contact_infos, :theme, :style, menus: [:items])
    restaurants_records_with_associations = restaurants.map do |record|
      record.attributes.merge(
        'menus' => record.menus,
        'theme' => record.theme
      )
    end
    render json: { restaurants: restaurants_records_with_associations }, status: :ok
  end

  def create
    restaurant = current_user.restaurants.new(restaurant_params)
    if restaurant.save
      render json: {}, status: :created
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

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :subdomain, :opening_hours)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
