require 'rails_helper'

RSpec.describe "Tags", type: :request do
    describe 'GET #index' do
        before(:example) do
          @first_tag = create(:tag)
          @last_tag = create(:tag)
          get '/tags.json', headers: authenticated_header(user)
          @json_response = JSON.parse(response.body)
        end
        
        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end
    
        it 'JSON response contains the correct number of entries' do
          expect(@json_response['tags'].count).to eq(2)
        end
    
        it 'JSON response body contains expected attributes' do
          expect(@json_response['tags'][0]).to include({
            'id' => @first_tag.id,
            'name' => @first_tag.name,
          }) 
        end
    end
  
    describe 'POST #create' do
      context 'when the tag is valid' do
        before(:example) do
          @tag_params = attributes_for(:tag)
          post '/tags', params: { tag: @tag_params }, headers: authenticated_header
        end
    
        it 'returns http created' do
          expect(response).to have_http_status(:created)
        end
    
        it 'saves the tag to the database' do
          expect(Tag.last.name).to eq(@tag_params[:name])
        end
      end
      context 'when the tag has invalid attributes' do
        before(:example) do
          @tag_params = attributes_for(:tag, :invalid_name)
          post '/tags', params: { tag: @tag_params }, headers: authenticated_header
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
    
    # describe 'PUT #update' do
    #   context 'when the tag attribute is valid' do 
    #     before(:example)do
    #       @tag = create(:tag)
    #       put "/tags/#{@tag.id}",params: { tag: {name: "Vegan"} }, headers: authenticated_header
    #     end
  
    #     it 'has a http no content response status' do
    #       expect(response).to have_http_status(:no_content)
    #     end
  
    #     it 'updates the opening hours in the database' do
    #       expect(Tag.find(@tag.id).opening_hours).to eq("Vegan")
    #     end
    #   end   
    #   context 'when the tag attribute is invalid' do
    #     before(:example) do
    #       @tag = create(:tag)
    #         put "/tags/#{@tag.id}",params: { tag: {opening_hours: nil} }, headers: authenticated_header()
    #       @json_response = JSON.parse(response.body)
    #     end
    #     it 'returns an unprocessable entity response ' do 
    #       expect(response).to have_http_status(:unprocessable_entity)
    #     end
    #     it 'has the correct number of errors'do
    #       expect(@json_response['errors'].count).to eq(2)
    #     end
    #   end
    # end
    
    # describe 'DELETE #destroy' do
    #   before(:example) do
    #     tag = create(:tag)
    #     delete "/tags/#{tag.id}", headers: authenticated_header
    #   end
  
    #   it 'has a http no content response status' do
    #     expect(response).to have_http_status(:no_content)
    #   end
  
    #   it 'removes the tag from the database' do
    #     expect(Tag.count).to eq(0)
    #   end
    # end
end
