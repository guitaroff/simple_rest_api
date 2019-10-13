require 'rails_helper'

RSpec.describe 'Categories API' do
  let!(:vertical)   { create(:vertical) }
  let!(:categories) { create_list(:category, 10, vertical: vertical) }
  let(:vertical_id) { vertical.id }
  let(:category_id) { categories.first.id }

  describe 'GET /verticals/:vertical_id/categories' do
    before { get "/verticals/#{vertical_id}/categories" }

    context 'when vertical exists' do
      it 'return status 200' do
        expect(response).to have_http_status(200)
      end

      it 'return all vertical categories' do
        expect(json.size).to eq(10)
      end
    end

    context 'when vertical does not exist' do
      let(:vertical_id) { 0 }

      it 'return status 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Vertical/)
      end
    end
  end

  describe 'GET /verticals/:vertical_id/categories/:id' do
    before { get "/verticals/#{vertical_id}/categories/#{category_id}" }

    context 'when vertical category exists' do
      it 'return status 200' do
        expect(response).to have_http_status(200)
      end

      it 'return the category' do
        expect(json['id']).to eq(category_id)
      end
    end

    context 'when vertical category does not exist' do
      let(:category_id) { 0 }

      it 'return status 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  describe 'POST /verticals/:vertical_id/categories' do
    let(:valid_attributes) { { category: { name: 'Pop Music', state: 'active' } } }

    context 'when request attributes are valid' do
      before { post "/verticals/#{vertical_id}/categories", params: valid_attributes }

      it 'return status 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/verticals/#{vertical_id}/categories", params:{category: {name: nil}} }

      it 'return status 422' do
        expect(response).to have_http_status(422)
      end

      it 'return a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PATCH /verticals/:vertical_id/categories/:id' do
    let(:valid_attributes) { { category: {name: 'Classic music'} } }

    before { patch "/verticals/#{vertical_id}/categories/#{category_id}", params: valid_attributes }

    context 'when category exists' do
      it 'return status 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the category' do
        updated_category = Category.find(category_id)
        expect(updated_category.name).to match(/Classic music/)
      end
    end

    context 'when the category does not exist' do
      let(:category_id) { 0 }

      it 'return status 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  describe 'DELETE /verticals/:vertical_id/categories/:id' do
    before { delete "/verticals/#{vertical_id}/categories/#{category_id}" }

    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
