require 'rails_helper'

RSpec.describe 'Restaurants API', type: :request do
  let!(:restaurants) { create_list(:restaurant, 10) }
  let(:restaurant_id) { restaurants.first.id }

  describe 'GET /restaurants' do
    before { get '/api/v1/restaurants' }

    it 'returns restaurants' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /restaurants/:id' do
    before { get "/api/v1/restaurants/#{restaurant_id}" }

    context 'when the record exists' do
      it 'returns the restaurant' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(restaurant_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:restaurant_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Engineer/)
      end
    end
  end

  describe 'POST /restaurants' do
    let(:valid_attributes) { { name: 'Sushi101', description: 'Best japansese food ever', location: 'Texas', avatar_link: 'link' } }

    context 'when the request is valid' do
      before { post '/api/v1/restaurants', params: valid_attributes }

      it 'creates an restaurant' do
        expect(json['name']).to eq('Sushi101')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/restaurants', params: { name: 'Foobar', description: 'Full', location: 'Bosnia' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/{"message":"Validation failed: Avatar link can't be blank"}/)
      end
    end
  end

  describe 'PUT /restaurants/:id' do
    let(:valid_attributes) { { name: 'Angelist' } }

    context 'when the record exists' do
      before { put "/api/v1/restaurants/#{restaurant_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /restaurants/:id' do
    before { delete "/api/v1/restaurants/#{restaurant_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end