class IngredientsController < ApplicationController
  before_action :authenticate_user
  before_action :set_ingredient, only: %i[update destroy]

  def create
    item = Item.find(params[:item_id])
    ingredient = Ingredient.new(ingredient_params)
    ingredient.item = item
    if ingredient.save
      render json: {}, status: :created
    else
      render json: { errors: ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @ingredient.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient.delete
    render json: {}, status: :no_content
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
