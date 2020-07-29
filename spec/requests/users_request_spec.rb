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
  
      context 'when the user is invalid' do
        before(:example) do
          @user_params = attributes_for(:user, :invalid)
          post '/sign-up', params: { user: @user_params }
          @json_response = JSON.parse(response.body)
        end
  
        it 'returns status unprocessable entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
  
        it 'returns the correct number of errors' do
          expect(@json_response['errors'].count).to eq(2)
        end
  
        it 'errors contains the correct message' do
          expect(@json_response['errors'][0]).to eq("Email can't be blank")
        end
      end
  end

  describe 'PUT #update' do
		context 'when the user is valid' do 
			before(:example)do
				@user = create(:user)
				put "/users/#{@user.id}",params: { user: {full_name: "Test"} }, headers: authenticated_header
			end

			it 'has a http no content response status' do
				expect(response).to have_http_status(:ok)
			end

			it 'updates the opening hours in the database' do
				expect(User.find(@user.id).full_name).to eq("Test")
			end
		end   
		context 'when the item attribute is invalid' do
			before(:example) do
				@user = create(:user)
					put "/users/#{@user.id}",params: { user: {full_name: nil} }, headers: authenticated_header()
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
end
