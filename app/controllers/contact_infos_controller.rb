class ContactInfosController < ApplicationController
  before_action :authenticate_user
  before_action :set_contact_info, only: %i[update destroy]

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    contact_info = ContactInfo.new(contact_info_params)
    contact_info.restaurant = restaurant
    if contact_info.save
      render json: {}, status: :created
    else
      render json: { errors: contact_info.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @contact_info.update(contact_info_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @contact_info.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @contact_info.delete
    render json: {}, status: :no_content
  end

  private

  def contact_info_params
    params.require(:contact_info).permit(:name, :info_type, :info)
  end

  def set_contact_info
    @contact_info = ContactInfo.find(params[:id])
  end
end
