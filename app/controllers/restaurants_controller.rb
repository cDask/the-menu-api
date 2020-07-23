class RestaurantsController < ApplicationController
  before_action :authenticate_user
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

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :subdomain, :opening_hours)
  end
end
