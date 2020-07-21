require 'rails_helper'

RSpec.describe "UserTokens", type: :request do
    describe 'POST #create' do
        context 'when the user token is valid' do
          before(:example) do
            @user_params = attributes_for(:user_token)
            post '/login', params: { auth: @user_params }
          end
    
          it 'returns http created' do
            expect(response).to have_http_status(:created)
          end
        end
    
        context 'when the user token is invalid' do
          before(:example) do
            @user_params = attributes_for(:user, :invalid)
            post '/login', params: { auth: @user_params }
            @json_response = JSON.parse(response.body)
          end
    
          it 'returns status unprocessable entity' do
            expect(response).to have_http_status(:unprocessable_entity)
          end
    
          it 'returns the correct number of errors' do
            expect(@json_response['errors'].count).to eq(2)
          end
    
          it 'errors contains the correct message' do
            expect(@json_response['errors'][0]).to eq("Invalid Login")
          end
        end
      end
  end
  