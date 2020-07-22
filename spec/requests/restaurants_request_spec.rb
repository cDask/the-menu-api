require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
    describe 'GET #index' do
        before(:example) do
          @first_restaurant = create(:restaurant)
          @last_restaurant = create(:restaurant)
          get '/restaurants', headers: authenticated_header
          @json_response = JSON.parse(response.body)
        end
    
        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end
    
        it 'JSON response contains the correct number of entries' do
          expect(@json_response['restaurant'].count).to eq(1)
        end
    
        it 'JSON response body contains expected attributes' do
          expect(@json_response['trails'][0]).to include({
            'id' => @first_restaurant.id,
            'name' => @first_restaurant.name,
            'opening_hours' => @first_restaurant.opening_hours,
            'subdomain' => @first_restaurant.subdomain
          }) 
        end
    end
end
