require 'rails_helper'

RSpec.describe "Items", type: :request do
	describe 'POST #create' do
		context 'when the item is valid' do
			before(:example) do
				@item_params = attributes_for(:item)
				menu = create(:menu)
				post "/items", params: { item: @item_params, menu_id: menu.id }, headers: authenticated_header
			end
	
			it 'returns http created' do
				expect(response).to have_http_status(:created)
			end
	
			it 'saves the item to the database' do
				expect(Item.last.name).to eq(@item_params[:name])
			end
		end
		context 'when the item has invalid attributes' do
			before(:example) do
				@item_params = attributes_for(:item, :invalid_name)
				menu = create(:menu)
				post "/items", params: { item: @item_params, menu_id: menu.id }, headers: authenticated_header
				@json_response = JSON.parse(response.body)
			end
	
			it 'returns http unprocessable entity' do
				expect(response).to have_http_status(:unprocessable_entity)
			end
	
			it 'returns the correct number of errors' do
				expect(@json_response['errors'].count).to eq(1)
			end
	
			it 'errors contains the correct message' do
				expect(@json_response['errors'][0]).to eq("Name can't be blank")
			end
		end
	end
	
	describe 'PUT #update' do
		context 'when the item attribute is valid' do 
			before(:example)do
				@item = create(:item)
				put "/items/#{@item.id}",params: { item: {name: "Test"} }, headers: authenticated_header
			end

			it 'has a http no content response status' do
				expect(response).to have_http_status(:no_content)
			end

			it 'updates the opening hours in the database' do
				expect(Item.find(@item.id).name).to eq("Test")
			end
		end   
		context 'when the item attribute is invalid' do
			before(:example) do
				@item = create(:item)
					put "/items/#{@item.id}",params: { item: {name: nil} }, headers: authenticated_header()
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
			item = create(:item)
			delete "/items/#{item.id}", headers: authenticated_header
		end

		it 'has a http no content response status' do
			expect(response).to have_http_status(:no_content)
		end

		it 'removes the item from the database' do
			expect(Item.count).to eq(0)
		end
	end
end
