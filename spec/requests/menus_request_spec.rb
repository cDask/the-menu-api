require 'rails_helper'

RSpec.describe "Menus", type: :request do
  
    describe 'POST #create' do
      context 'when the menu is valid' do
        before(:example) do
          @menu_params = attributes_for(:menu)
          @restaurant = create(:restaurant)
          post "/restaurants/#{@restaurant.id}/menus", params: { menu: @menu_params }, headers: authenticated_header
        end
    
        it 'returns http created' do
          expect(response).to have_http_status(:created)
        end
    
        it 'saves the menu to the database' do
          expect(Menu.last.title).to eq(@menu_params[:title])
        end
      end
      context 'when the menu has invalid attributes' do
        before(:example) do
          @menu_params = attributes_for(:menu, :invalid_title)
          @restaurant = create(:restaurant)
          post "/restaurants/#{@restaurant.id}/menus", params: { menu: @menu_params }, headers: authenticated_header
          @json_response = JSON.parse(response.body)
        end
    
        it 'returns http unprocessable entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
    
        it 'returns the correct number of errors' do
          pp @json_response['errors']
          expect(@json_response['errors'].count).to eq(1)
        end
    
        it 'errors contains the correct message' do
          expect(@json_response['errors'][0]).to eq("Title can't be blank")
        end
      end
    end
    
    describe 'PUT #update' do
      context 'when the menu attribute is valid' do 
        before(:example)do
          @menu = create(:menu)
          put "/restaurants/#{@menu.restaurant_id}/menus/#{@menu.id}",params: { menu: {title: "Test"} }, headers: authenticated_header
        end
  
        it 'has a http no content response status' do
          expect(response).to have_http_status(:no_content)
        end
  
        it 'updates the opening hours in the database' do
          expect(Menu.find(@menu.id).title).to eq("Test")
        end
      end   
      context 'when the menu attribute is invalid' do
        before(:example) do
          @menu = create(:menu)
            put "/restaurants/#{@menu.restaurant_id}/menus/#{@menu.id}",params: { menu: {title: nil} }, headers: authenticated_header()
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
        menu = create(:menu)
        delete "/restaurants/#{menu.restaurant_id}/menus/#{menu.id}", headers: authenticated_header
      end
  
      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end
  
      it 'removes the menu from the database' do
        expect(Menu.count).to eq(0)
      end
    end
end
