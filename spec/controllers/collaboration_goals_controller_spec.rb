require 'rails_helper'

describe CollaborationGoalsController do
  let(:valid_attributes) {
    {
      project_id: 0,
      requester_goal_id: 0,
      requestee_goal_id: 0,
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      collaboration_goal = CollaborationGoal.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      collaboration_goal = CollaborationGoal.create! valid_attributes
      get :show, params: { id: collaboration_goal.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new collaboration_goal' do
        expect {
          post :create, params: { collaboration_goal: valid_attributes }, session: valid_session
        }.to change(CollaborationGoal, :count).by(1)
      end

      it 'renders a JSON response with the new collaboration_goal' do
        post :create, params: { collaboration_goal: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(collaboration_goal_url(CollaborationGoal.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new collaboration_goal' do
        post :create, params: { collaboration_goal: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          project_id: 1,
          requester_goal_id: 1,
          requestee_goal_id: 1,
        }
      }

      it 'updates the requested collaboration_goal' do
        collaboration_goal = CollaborationGoal.create! valid_attributes
        put :update, params: { id: collaboration_goal.to_param, collaboration_goal: new_attributes }, session: valid_session
        collaboration_goal.reload
        expect(collaboration_goal.project_id).to eq(1)
        expect(collaboration_goal.requester_goal_id).to eq(1)
        expect(collaboration_goal.requestee_goal_id).to eq(1)
      end

      it 'renders a JSON response with the updated collaboration_goal' do
        collaboration_goal = CollaborationGoal.create! valid_attributes
        put :update, params: { id: collaboration_goal.to_param, collaboration_goal: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated collaboration_goal' do
        collaboration_goal = CollaborationGoal.create! valid_attributes
        put :update, params: { id: collaboration_goal.to_param, collaboration_goal: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested collaboration_goal' do
      collaboration_goal = CollaborationGoal.create! valid_attributes
      expect {
        delete :destroy, params: { id: collaboration_goal.to_param }, session: valid_session
      }.to change(CollaborationGoal, :count).by(-1)
    end
  end
end
