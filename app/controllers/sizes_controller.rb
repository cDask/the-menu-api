class SizesController < ApplicationController
  before_action :authenticate_user
  before_action :set_size, only: %i[update destroy]

  def create
    item = Item.find(params[:item_id])
    size = Size.new(size_params)
    size.item = item
    if size.save
      render json: {}, status: :created
    else
      render json: { errors: size.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @size.update(size_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @size.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @size.delete
    render json: {}, status: :no_content
  end

  private

  def size_params
    params.require(:size).permit(:name, :price)
  end

  def set_size
    @size = Size.find(params[:id])
  end
end
