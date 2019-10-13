require 'rails_helper'

RSpec.describe 'Verticals API' do
  let!(:verticals) { create_list(:vertical, 10) }
  let(:vertical_id) { verticals.first.id }

  describe 'GET /verticals' do
    before { get '/verticals' }

    it 'return verticals' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /verticals/:id' do
    before { get "/verticals/#{vertical_id}" }

    context 'when the record exists' do
      it 'return the vertical' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(vertical_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:vertical_id) { 1245 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Vertical/)
      end
    end
  end

  describe 'POST /verticals' do
    let(:valid_attributes) { { vertical: { name: 'Finance' } } }

    context 'when the request is valid' do
      before { post '/verticals', params: valid_attributes }

      it 'creates a vertical' do
        expect(json['name']).to eq('Finance')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/verticals', params: { vertical: { name: nil } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/"Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PATCH /verticals/:id' do
    let(:valid_attributes) { { vertical: {name: 'Sport' } } }

    context 'when the record exists' do
      before { patch "/verticals/#{vertical_id}", params: valid_attributes }

      it 'return status 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /verticals/:id' do
    before { delete "/verticals/#{vertical_id}" }

    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
