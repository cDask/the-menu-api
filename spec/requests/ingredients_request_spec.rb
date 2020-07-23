require 'rails_helper'

RSpec.describe "Ingredients", type: :request do

  describe 'POST #create' do
    context 'when the ingredient is valid' do
      before(:example) do
        @ingredient_params = attributes_for(:ingredient)
        @item = create(:item)
        post "/items/#{@item.id}/ingredients", params: { ingredient: @ingredient_params }, headers: authenticated_header
      end
  
      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end
  
      it 'saves the ingredient to the database' do
        expect(Ingredient.last.name).to eq(@ingredient_params[:name])
      end
    end
    context 'when the ingredient has invalid attributes' do
      before(:example) do
        @ingredient_params = attributes_for(:ingredient, :invalid_name)
        @item = create(:item)
        post "/items/#{@item.id}/ingredients", params: { ingredient: @ingredient_params }, headers: authenticated_header
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
    context 'when the ingredient attribute is valid' do 
      before(:example)do
        @ingredient = create(:ingredient)
        put "/items/#{@ingredient.item_id}/ingredients/#{@ingredient.id}",params: { ingredient: {name: "Test"} }, headers: authenticated_header
      end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the opening hours in the database' do
        expect(Ingredient.find(@ingredient.id).name).to eq("Test")
      end
    end   
    context 'when the ingredient attribute is invalid' do
      before(:example) do
        @ingredient = create(:ingredient)
        put "/items/#{@ingredient.item_id}/ingredients/#{@ingredient.id}",params: { ingredient: {name: nil} }, headers: authenticated_header()
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
      ingredient = create(:ingredient)
      delete "/items/#{ingredient.item_id}/ingredients/#{ingredient.id}", headers: authenticated_header
    end

    it 'has a http no content response status' do
      expect(response).to have_http_status(:no_content)
    end

    it 'removes the ingredient from the database' do
      expect(Ingredient.count).to eq(0)
    end
  end
end
