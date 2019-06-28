require 'rails_helper'

describe SubGoalsController do
  let(:valid_attributes) {
    {
      goal_id: 0,
      content: 'Test content',
      is_complete: false
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      sub_goal = SubGoal.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      sub_goal = SubGoal.create! valid_attributes
      get :show, params: { id: sub_goal.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new sub_goal' do
        expect {
          post :create, params: { sub_goal: valid_attributes }, session: valid_session
        }.to change(SubGoal, :count).by(1)
      end

      it 'renders a JSON response with the new sub_goal' do
        post :create, params: { sub_goal: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(sub_goal_url(SubGoal.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new sub_goal' do
        post :create, params: { sub_goal: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          goal_id: 0,
          content: 'New content',
          is_complete: false
        }
      }

      it 'updates the requested sub_goal' do
        sub_goal = SubGoal.create! valid_attributes
        put :update, params: { id: sub_goal.to_param, sub_goal: new_attributes }, session: valid_session
        sub_goal.reload
        expect(sub_goal.content).to eq('New content')
      end

      it 'renders a JSON response with the updated sub_goal' do
        sub_goal = SubGoal.create! valid_attributes
        put :update, params: { id: sub_goal.to_param, sub_goal: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated sub_goal' do
        sub_goal = SubGoal.create! valid_attributes
        put :update, params: { id: sub_goal.to_param, sub_goal: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested sub_goal' do
      sub_goal = SubGoal.create! valid_attributes
      expect {
        delete :destroy, params: { id: sub_goal.to_param }, session: valid_session
      }.to change(SubGoal, :count).by(-1)
    end
  end
end
