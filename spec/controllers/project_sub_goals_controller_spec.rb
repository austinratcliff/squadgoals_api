require 'rails_helper'

describe ProjectSubGoalsController do
  let(:valid_attributes) {
    {
      project_goal_id: 0,
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
      project_sub_goal = ProjectSubGoal.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      project_sub_goal = ProjectSubGoal.create! valid_attributes
      get :show, params: { id: project_sub_goal.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new project_sub_goal' do
        expect {
          post :create, params: { project_sub_goal: valid_attributes }, session: valid_session
        }.to change(ProjectSubGoal, :count).by(1)
      end

      it 'renders a JSON response with the new project_sub_goal' do
        post :create, params: { project_sub_goal: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(project_sub_goal_url(ProjectSubGoal.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new project_sub_goal' do
        post :create, params: { project_sub_goal: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          project_id: 0,
          content: 'New content',
          by_when: DateTime.now,
          is_private: false
        }
      }

      it 'updates the requested project_sub_goal' do
        project_sub_goal = ProjectSubGoal.create! valid_attributes
        put :update, params: { id: project_sub_goal.to_param, project_sub_goal: new_attributes }, session: valid_session
        project_sub_goal.reload
        expect(project_sub_goal.content).to eq('New content')
      end

      it 'renders a JSON response with the updated project_sub_goal' do
        project_sub_goal = ProjectSubGoal.create! valid_attributes
        put :update, params: { id: project_sub_goal.to_param, project_sub_goal: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated project_sub_goal' do
        project_sub_goal = ProjectSubGoal.create! valid_attributes
        put :update, params: { id: project_sub_goal.to_param, project_sub_goal: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested project_sub_goal' do
      project_sub_goal = ProjectSubGoal.create! valid_attributes
      expect {
        delete :destroy, params: { id: project_sub_goal.to_param }, session: valid_session
      }.to change(ProjectSubGoal, :count).by(-1)
    end
  end
end
