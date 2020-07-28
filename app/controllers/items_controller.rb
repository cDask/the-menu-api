class ItemsController < ApplicationController
  before_action :authenticate_user
  before_action :set_item, only: %i[update destroy]

  def create
    menu = Menu.find(params[:menu_id])
    item = Item.new(item_params)
    item.menu = menu
    if item.save
      render json: item, status: :created
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    render json: {}, status: :no_content
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
