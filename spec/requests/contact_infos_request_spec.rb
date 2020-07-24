require 'rails_helper'

RSpec.describe "ContactInfos", type: :request do
  describe 'POST #create' do
    context 'when the contact_info is valid' do
      before(:example) do
        @contact_info_params = attributes_for(:contact_info)
        @restaurant = create(:restaurant)
        post "/restaurants/#{@restaurant.id}/contact_infos", params: { contact_info: @contact_info_params }, headers: authenticated_header
      end
  
      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end
  
      it 'saves the contact_info to the database' do
        expect(ContactInfo.last.name).to eq(@contact_info_params[:name])
      end
    end
    context 'when the contact_info has invalid attributes' do
      before(:example) do
        @contact_info_params = attributes_for(:contact_info, :invalid_name)
        @restaurant = create(:restaurant)
        post "/restaurants/#{@restaurant.id}/contact_infos", params: { contact_info: @contact_info_params }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end
  
      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
  
      it 'returns the correct number of errors' do
        expect(@json_response['errors'].count).to eq(1)
      end
  
      it 'errors contains the correct message' do
        expect(@json_response['errors'][0]).to eq("Name can't be blank")
      end
    end
  end
  
  describe 'PUT #update' do
    context 'when the contact info has attributes are valid' do 
      before(:example)do
        @contact_info = create(:contact_info)
        put "/restaurants/#{@contact_info.restaurant_id}/contact_infos/#{@contact_info.id}",params: { contact_info: {name: "Test"} }, headers: authenticated_header
      end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the opening hours in the database' do
        expect(ContactInfo.find(@contact_info.id).name).to eq("Test")
      end
    end   
    context 'when the contact_info attribute is invalid' do
      before(:example) do
        @contact_info = create(:contact_info)
          put "/restaurants/#{@contact_info.restaurant_id}/contact_infos/#{@contact_info.id}",params: { contact_info: {name: nil} }, headers: authenticated_header()
        @json_response = JSON.parse(response.body)
      end
      it 'returns an unprocessable entity response ' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it 'has the correct number of errors'do
        expect(@json_response['errors'].count).to eq(1)
      end
    end
  end
  
  describe 'DELETE #destroy' do
    before(:example) do
      contact_info = create(:contact_info)
      delete "/restaurants/#{contact_info.restaurant_id}/contact_infos/#{contact_info.id}", headers: authenticated_header
    end

    it 'has a http no content response status' do
      expect(response).to have_http_status(:no_content)
    end

    it 'removes the contact_info from the database' do
      expect(ContactInfo.count).to eq(0)
    end
  end
end
