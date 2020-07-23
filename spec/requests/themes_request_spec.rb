require 'rails_helper'

RSpec.describe "Themes", type: :request do
  describe 'POST #create' do
		context 'when the theme is valid' do
			before(:example) do
				@theme_params = attributes_for(:theme)
				menu = create(:menu)
				post "/themes", params: { theme: @theme_params, themeable_id: menu.id, themable_type: "Menu" }, headers: authenticated_header
			end
	
			it 'returns http created' do
				expect(response).to have_http_status(:created)
			end
	
			it 'saves the theme to the database' do
				expect(Theme.last.theme_class).to eq(@theme_params[:theme_class])
			end
		end
		context 'when the theme has invalid attributes' do
			before(:example) do
				@theme_params = attributes_for(:theme, :invalid_theme_class)
				menu = create(:menu)
				post "/themes", params: { theme: @theme_params, themeable_id: menu.id, themeable_type: "Menu" }, headers: authenticated_header
				@json_response = JSON.parse(response.body)
			end
	
			it 'returns http unprocessable entity' do
				expect(response).to have_http_status(:unprocessable_entity)
			end
	
			it 'returns the correct number of errors' do
				expect(@json_response['errors'].count).to eq(2)
			end
	
			it 'errors contains the correct message' do
				expect(@json_response['errors'][0]).to eq("Theme class can't be blank")
			end
		end
	end
	
	describe 'PUT #update' do
		context 'when the theme attribute is valid' do 
			before(:example)do
				@theme = create(:theme)
				put "/themes/#{@theme.id}",params: { theme: {theme_class: "bold"} }, headers: authenticated_header
			end

			it 'has a http no content response status' do
				expect(response).to have_http_status(:no_content)
			end

			it 'updates the opening hours in the database' do
				expect(Theme.find(@theme.id).theme_class).to eq("bold")
			end
		end   
		context 'when the theme attribute is invalid' do
			before(:example) do
				@theme = create(:theme)
					put "/themes/#{@theme.id}",params: { theme: {theme_class: nil} }, headers: authenticated_header()
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
			theme = create(:theme)
			delete "/themes/#{theme.id}", headers: authenticated_header
		end

		it 'has a http no content response status' do
			expect(response).to have_http_status(:no_content)
		end

		it 'removes the theme from the database' do
			expect(Theme.count).to eq(0)
		end
	end
end
