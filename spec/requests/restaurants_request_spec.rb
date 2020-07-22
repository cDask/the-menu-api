require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
    describe 'GET #index' do
        before(:example) do
          @user = user_with_restaurants
          get '/restaurants', headers: authenticated_header(@user)
          @json_response = JSON.parse(response.body)
        end
    
        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end
    
        it 'JSON response contains the correct number of entries' do
          expect(@json_response.count).to eq(2)
        end
    
        it 'JSON response body contains expected attributes' do
          expect(@json_response[0]).to include({
            'id' => @user.restaurants[0].id,
            'name' => @user.restaurants[0].name,
            'opening_hours' => @user.restaurants[0].opening_hours,
            'subdomain' => @user.restaurants[0].subdomain
          }) 
        end
    end
end
