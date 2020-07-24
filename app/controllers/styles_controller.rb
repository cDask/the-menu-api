class StylesController < ApplicationController
  before_action :authenticate_user
  before_action :set_style, only: %i[update destroy]

  def create
    style = Style.new(style_params)
    style.styleable_type = params[:styleable_type]
    style.styleable_id = params[:styleable_id]

    if style.save
      render json: {}, status: :created
    else
      render json: { errors: style.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @style.update(style_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @style.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @style.delete
    render json: {}, status: :no_content
  end

  private

  def style_params
    params.require(:style).permit(:style_data)
  end

  def set_style
    @style = Style.find(params[:id])
  end
end
