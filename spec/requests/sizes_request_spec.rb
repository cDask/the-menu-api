require 'rails_helper'

RSpec.describe "Sizes", type: :request do
  describe 'POST #create' do
    context 'when the size is valid' do
      before(:example) do
        @size_params = attributes_for(:size)
        @item = create(:item)
        post "/items/#{@item.id}/sizes", params: { size: @size_params }, headers: authenticated_header
      end
  
      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end
  
      it 'saves the size to the database' do
        expect(Size.last.name).to eq(@size_params[:name])
      end
    end
    context 'when the size has invalid attributes' do
      before(:example) do
        @size_params = attributes_for(:size, :invalid_name)
        @item = create(:item)
        post "/items/#{@item.id}/sizes", params: { size: @size_params }, headers: authenticated_header
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
    context 'when the size attribute is valid' do 
      before(:example)do
        @size = create(:size)
        put "/items/#{@size.item_id}/sizes/#{@size.id}",params: { size: {name: "Test"} }, headers: authenticated_header
      end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the opening hours in the database' do
        expect(Size.find(@size.id).name).to eq("Test")
      end
    end   
    context 'when the size attribute is invalid' do
      before(:example) do
        @size = create(:size)
        put "/items/#{@size.item_id}/sizes/#{@size.id}",params: { size: {name: nil} }, headers: authenticated_header()
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
      size = create(:size)
      delete "/items/#{size.item_id}/sizes/#{size.id}", headers: authenticated_header
    end

    it 'has a http no content response status' do
      expect(response).to have_http_status(:no_content)
    end

    it 'removes the size from the database' do
      expect(Size.count).to eq(0)
    end
  end
end
