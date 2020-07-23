class MenusController < ApplicationController
  before_action :authenticate_user
  before_action :set_menu, only: %i[update destroy]

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    menu = Menu.new(menu_params)
    menu.restaurant = restaurant
    if menu.save
      render json: {}, status: :created
    else
      render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @menu.update(menu_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @menu.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @menu.delete
    render json: {}, status: :no_content
  end

  private

  def menu_params
    params.require(:menu).permit(:title)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
