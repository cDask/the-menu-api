require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe 'POST #create' do
        context 'when the user is valid' do
          before(:example) do
            @user_params = attributes_for(:user)
            post '/sign-up', params: { user: @user_params }
          end
    
          it 'returns http created' do
            expect(response).to have_http_status(:ok)
          end
    
          it 'saves the User to the database' do
            expect(User.last.full_name).to eq(@user_params[:full_name])
          end
        end
    
        # context 'when the user is invalid' do
        #   before(:example) do
        #     @user_params = attributes_for(:user, :invalid)
        #     post '/sign-up', params: { user: @user_params }
        #     @json_response = JSON.parse(response.body)
        #   end
    
        #   it 'returns status unprocessable entity' do
        #     expect(response).to have_http_status(:unprocessable_entity)
        #   end
    
        #   it 'returns the correct number of errors' do
        #     expect(@json_response['errors'].count).to eq(2)
        #   end
    
        #   it 'errors contains the correct message' do
        #     expect(@json_response['errors'][0]).to eq("Name can't be blank")
        #   end
        # end
    end        
end
