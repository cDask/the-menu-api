require 'rails_helper'

RSpec.describe "Menus", type: :request do
  
    describe 'POST #create' do
      context 'when the menu is valid' do
        before(:example) do
          @menu_params = attributes_for(:menu)
          post '/menus', params: { menu: @menu_params }, headers: authenticated_header
        end
    
        it 'returns http created' do
          expect(response).to have_http_status(:created)
        end
    
        it 'saves the Trail to the database' do
          expect(Menu.last.title).to eq(@menu_params[:title])
        end
      end
      context 'when the menu has invalid attributes' do
        before(:example) do
          @menu_params = attributes_for(:menu, :invalid_name)
          post '/menus', params: { menu: @menu_params }, headers: authenticated_header
          @json_response = JSON.parse(response.body)
        end
    
        it 'returns http unprocessable entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
    
        it 'returns the correct number of errors' do
          pp @json_response['errors']
          expect(@json_response['errors'].count).to eq(2)
        end
    
        it 'errors contains the correct message' do
          expect(@json_response['errors'][0]).to eq("Name can't be blank")
        end
      end
    end
    
    describe 'PUT #update' do
      context 'when the menu attribute is valid' do 
        before(:example)do
          @menu = create(:menu)
          put "/menus/#{@menu.id}",params: { menu: {opening_hours: "{Monday}"} }, headers: authenticated_header
        end
  
        it 'has a http no content response status' do
          expect(response).to have_http_status(:no_content)
        end
  
        it 'updates the opening hours in the database' do
          expect(Menu.find(@menu.id).opening_hours).to eq("{Monday}")
        end
      end   
      context 'when the menu attribute is invalid' do
        before(:example) do
          @menu = create(:menu)
            put "/menus/#{@menu.id}",params: { menu: {opening_hours: nil} }, headers: authenticated_header()
          @json_response = JSON.parse(response.body)
        end
        it 'returns an unprocessable entity response ' do 
          expect(response).to have_http_status(:unprocessable_entity)
        end
        it 'has the correct number of errors'do
          expect(@json_response['errors'].count).to eq(2)
        end
      end
    end
    
    describe 'DELETE #destroy' do
      before(:example) do
        menu = create(:menu)
        delete "/menus/#{menu.id}", headers: authenticated_header
      end
  
      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end
  
      it 'removes the trail from the database' do
        expect(Menu.count).to eq(0)
      end
    end
end
