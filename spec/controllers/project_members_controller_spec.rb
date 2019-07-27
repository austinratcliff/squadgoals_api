require 'rails_helper'

describe ProjectMembersController do
  austin = User.create(
    first_name: 'Austin',
    last_name: 'Ratcliff',
    name: 'Austin Ratcliff',
    email: 'austin@example.com',
    phone: '1234567890',
    password: 'password',
    password_confirmation: 'password'
  )

  project = Project.create(
    user_id: austin.id,
    name: 'Brainstorm',
    description: 'A space brainstorm apps, films, and other creative things.',
    is_private: true
  )

  let(:valid_attributes) {
    {
      project_id: project.id,
      member_id: austin.id
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      project_member = ProjectMember.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      project_member = ProjectMember.create! valid_attributes
      get :show, params: { id: project_member.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new project_member' do
        expect {
          post :create, params: { project_member: valid_attributes }, session: valid_session
        }.to change(ProjectMember, :count).by(1)
      end

      it 'renders a JSON response with the new project_member' do
        post :create, params: { project_member: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(project_member_url(ProjectMember.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new project_member' do
        post :create, params: { project_member: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        skip('Project members cannot get updated')
      }

      it 'updates the requested project_member' do
        project_member = ProjectMember.create! valid_attributes
        put :update, params: { id: project_member.to_param, project_member: new_attributes }, session: valid_session
        project_member.reload
        expect(project_member.project_id).to eq(1)
        expect(project_member.member_id).to eq(1)
      end

      it 'renders a JSON response with the updated project_member' do
        project_member = ProjectMember.create! valid_attributes
        put :update, params: { id: project_member.to_param, project_member: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated project_member' do
        project_member = ProjectMember.create! valid_attributes
        put :update, params: { id: project_member.to_param, project_member: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested project_member' do
      project_member = ProjectMember.create! valid_attributes
      expect {
        delete :destroy, params: { id: project_member.to_param }, session: valid_session
      }.to change(ProjectMember, :count).by(-1)
    end
  end
end
