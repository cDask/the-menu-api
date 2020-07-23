require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
  describe 'GET #index' do
      before(:example) do
        user = user_with_restaurants
        @first_restaurant = user.restaurants.first
        get '/restaurants', headers: authenticated_header(user)
        @json_response = JSON.parse(response.body)
      end
  
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
  
      it 'JSON response contains the correct number of entries' do
        expect(@json_response['restaurants'].count).to eq(2)
      end
  
      it 'JSON response body contains expected attributes' do
        expect(@json_response['restaurants'][0]).to include({
          'id' => @first_restaurant.id,
          'name' => @first_restaurant.name,
          'opening_hours' => @first_restaurant.opening_hours,
          'subdomain' => @first_restaurant.subdomain
        }) 
      end
  end

  describe 'POST #create' do
    context 'when the restaurant is valid' do
      before(:example) do
        @restaurant_params = attributes_for(:restaurant)
        post '/restaurants', params: { restaurant: @restaurant_params }, headers: authenticated_header
      end
  
      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end
  
      it 'saves the Trail to the database' do
        expect(Restaurant.last.name).to eq(@restaurant_params[:name])
      end
    end
    context 'when the restaurant has invalid attributes' do
      before(:example) do
        @restaurant_params = attributes_for(:restaurant, :invalid_name)
        post '/restaurants', params: { restaurant: @restaurant_params }, headers: authenticated_header
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
    context 'when the restaurant attribute is valid' do 
      before(:example)do
        @restaurant = create(:restaurant)
        put "/restaurants/#{@restaurant.id}",params: { restaurant: {opening_hours: "{Monday}"} }, headers: authenticated_header
      end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the opening hours in the database' do
        expect(Restaurant.find(@restaurant.id).opening_hours).to eq("{Monday}")
      end
    end   
    context 'when the restaurant attribute is invalid' do
      before(:example) do
        @restaurant = create(:restaurant)
          put "/restaurants/#{@restaurant.id}",params: { restaurant: {opening_hours: nil} }, headers: authenticated_header()
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
end
