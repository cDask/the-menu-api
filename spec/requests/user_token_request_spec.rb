require 'rails_helper'

RSpec.describe "UserTokens", type: :request do
    describe 'POST #create' do
        context 'when the user token is valid' do
          before(:example) do
            @user = create(:user)
            post '/login', params: { auth: {email: @user.email, password: "password"} }
          end
    
          it 'returns http created' do
            expect(response).to have_http_status(:created)
          end
        end
    
        context 'when the user token is invalid' do
          before(:example) do
            post '/login', params: { auth: {email: ""}}
            # @json_response = JSON.parse(response.body)
          end
    
          it 'returns status unprocessable entity' do
            expect(response).to have_http_status(:not_found)
          end
    
          # it 'returns the correct number of errors' do
          #   expect(@json_response['errors'].count).to eq(2)
          # end
    
          # it 'errors contains the correct message' do
          #   expect(@json_response['errors'][0]).to eq("Invalid Login")
          # end
        end
      end
  end
  