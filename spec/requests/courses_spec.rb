require 'rails_helper'

RSpec.describe 'Categories API' do
  let!(:vertical)   { create(:vertical) }
  let!(:category)   { create(:category, vertical: vertical) }
  let!(:courses)    { create_list(:course, 10, category: category) }
  let(:category_id) { category.id }
  let(:course_id)   { courses.first.id }

  describe 'GET /categories/:category_id/courses' do
    before { get "/categories/#{category_id}/courses" }

    context 'when category exists' do
      it 'return status 200' do
        expect(response).to have_http_status(200)
      end

      it 'return all category courses' do
        expect(json.size).to eq(10)
      end
    end

    context 'when category does not exist' do
      let(:category_id) { 0 }

      it 'return status 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  describe 'GET /categories/:category_id/courses/:id' do
    before { get "/categories/#{category_id}/courses/#{course_id}" }

    context 'when category course exists' do
      it 'return status 200' do
        expect(response).to have_http_status(200)
      end

      it 'return the course' do
        expect(json['id']).to eq(course_id)
      end
    end

    context 'when category course does not exist' do
      let(:course_id) { 0 }

      it 'return status 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Course/)
      end
    end
  end

  describe 'POST /categories/:category_id/courses' do
    let(:valid_attributes) { { course: { name: 'Learn the Cello', author: 'Lang Lang', state: 'active' } } }

    context 'when request attributes are valid' do
      before { post "/categories/#{category_id}/courses", params: valid_attributes }

      it 'return status 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PATCH /categories/:category_id/courses/:id' do
    let(:valid_attributes) { { course: {name: 'Learn the Violin'} } }

    before { patch "/categories/#{category_id}/courses/#{course_id}", params: valid_attributes }

    context 'when course exists' do
      it 'return status 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the course' do
        updated_course = Course.find(course_id)
        expect(updated_course.name).to match(/Learn the Violin/)
      end
    end

    context 'when the course does not exist' do
      let(:course_id) { 0 }

      it 'return status 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Course/)
      end
    end
  end

  describe 'DELETE /categories/:category_id/courses/:id' do
    before { delete "/categories/#{category_id}/courses/#{course_id}" }

    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
