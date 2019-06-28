require 'rails_helper'

describe ProjectsController do
  let(:valid_attributes) {
    {
      user_id: 0,
      name: 'Test name',
      description: 'Test description',
      is_private: false
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      project = Project.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      project = Project.create! valid_attributes
      get :show, params: { id: project.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new project' do
        expect {
          post :create, params: { project: valid_attributes }, session: valid_session
        }.to change(Project, :count).by(1)
      end

      it 'renders a JSON response with the new project' do
        post :create, params: { project: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(project_url(Project.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new project' do
        post :create, params: { project: invalid_attributes }, session: valid_session
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
          name: 'New name',
          description: 'New description',
          is_private: false
        }
      }

      it 'updates the requested project' do
        project = Project.create! valid_attributes
        put :update, params: { id: project.to_param, project: new_attributes }, session: valid_session
        project.reload
        expect(project.name).to eq('New name')
        expect(project.description).to eq('New description')
      end

      it 'renders a JSON response with the updated project' do
        project = Project.create! valid_attributes
        put :update, params: { id: project.to_param, project: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated project' do
        project = Project.create! valid_attributes
        put :update, params: { id: project.to_param, project: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested project' do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, params: { id: project.to_param }, session: valid_session
      }.to change(Project, :count).by(-1)
    end
  end
end
