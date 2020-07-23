class TagsController < ApplicationController
  def index
    render json: { tags: Tag.all }
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: {}, status: :created
    else
      render json: { errors: tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
