require 'rails_helper'

RSpec.describe "Styles", type: :request do
  describe 'POST #create' do
		context 'when the style is valid' do
			before(:example) do
				@style_params = attributes_for(:style)
				menu = create(:menu)
				post "/styles", params: { style: @style_params, styleable_id: menu.id, styleable_type: "Menu" }, headers: authenticated_header
			end
	
			it 'returns http created' do
				expect(response).to have_http_status(:created)
			end
	
			it 'saves the style to the database' do
				expect(Style.last.style_data).to eq(@style_params[:style_data])
			end
		end
		context 'when the style has invalid attributes' do
			before(:example) do
				@style_params = attributes_for(:style, :invalid_style_data)
				menu = create(:menu)
				post "/styles", params: { style: @style_params, styleable_id: menu.id, styleable_type: "Menu" }, headers: authenticated_header
				@json_response = JSON.parse(response.body)
			end
	
			it 'returns http unprocessable entity' do
				expect(response).to have_http_status(:unprocessable_entity)
			end
	
			it 'returns the correct number of errors' do
				expect(@json_response['errors'].count).to eq(2)
			end
	
			it 'errors contains the correct message' do
				expect(@json_response['errors'][0]).to eq("Style data can't be blank")
			end
		end
	end
	
	describe 'PUT #update' do
		context 'when the style attribute is valid' do 
			before(:example)do
				@style = create(:style)
				put "/styles/#{@style.id}",params: { style: {style_data: "{ 'background': '#000000' }"} }, headers: authenticated_header
			end

			it 'has a http no content response status' do
				expect(response).to have_http_status(:no_content)
			end

			it 'updates the opening hours in the database' do
				expect(Style.find(@style.id).style_data).to eq("{ 'background': '#000000' }")
			end
		end   
		context 'when the style attribute is invalid' do
			before(:example) do
				@style = create(:style)
				put "/styles/#{@style.id}",params: { style: {style_data: nil} }, headers: authenticated_header()
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
			style = create(:style)
			delete "/styles/#{style.id}", headers: authenticated_header
		end

		it 'has a http no content response status' do
			expect(response).to have_http_status(:no_content)
		end

		it 'removes the style from the database' do
			expect(Style.count).to eq(0)
		end
	end
end
