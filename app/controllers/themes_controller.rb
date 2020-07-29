class ThemesController < ApplicationController
  before_action :authenticate_user
  before_action :set_theme, only: %i[update destroy]

  def create
    theme = Theme.new(theme_params)
    theme.themeable_type = params[:themeable_type]
    theme.themeable_id = params[:themeable_id]

    if theme.save
      render json: {}, status: :created
    else
      render json: { errors: theme.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @theme.update(theme_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @theme.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @theme.destroy
    render json: {}, status: :no_content
  end

  private

  def theme_params
    params.require(:theme).permit(:theme_class)
  end

  def set_theme
    @theme = Theme.find(params[:id])
  end
end
