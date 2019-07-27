require 'rails_helper'

describe GoalsController do
  category = Category.create(
    name: 'Career'
  )

  let(:valid_attributes) {
    {
      user_id: 0,
      category_id: category.id,
      content: 'Test content',
      by_when: DateTime.now,
      is_private: false
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      goal = Goal.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      goal = Goal.create! valid_attributes
      get :show, params: { id: goal.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new goal' do
        expect {
          post :create, params: { goal: valid_attributes }, session: valid_session
        }.to change(Goal, :count).by(1)
      end

      it 'renders a JSON response with the new goal' do
        post :create, params: { goal: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(goal_url(Goal.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new goal' do
        post :create, params: { goal: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          user_id: 0,
          category_id: category.id,
          content: 'New content',
          by_when: DateTime.now,
          is_private: false
        }
      }

      it 'updates the requested goal' do
        goal = Goal.create! valid_attributes
        put :update, params: { id: goal.to_param, goal: new_attributes }, session: valid_session
        goal.reload
        expect(goal.content).to eq('New content')
      end

      it 'renders a JSON response with the updated goal' do
        goal = Goal.create! valid_attributes
        put :update, params: { id: goal.to_param, goal: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated goal' do
        goal = Goal.create! valid_attributes
        put :update, params: { id: goal.to_param, goal: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested goal' do
      goal = Goal.create! valid_attributes
      expect {
        delete :destroy, params: { id: goal.to_param }, session: valid_session
      }.to change(Goal, :count).by(-1)
    end
  end
end
