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
      end
  end
    