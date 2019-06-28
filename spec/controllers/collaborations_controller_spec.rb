require 'rails_helper'

describe CollaborationsController do
  let(:valid_attributes) {
    {
      message: 'Test message',
      requester_id: 0,
      requestee_id: 0,
      requester_goal_id: 0,
      requestee_goal_id: 0,
      request_status_id: 0
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      collaboration = Collaboration.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      collaboration = Collaboration.create! valid_attributes
      get :show, params: { id: collaboration.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new collaboration' do
        expect {
          post :create, params: { collaboration: valid_attributes }, session: valid_session
        }.to change(Collaboration, :count).by(1)
      end

      it 'renders a JSON response with the new collaboration' do
        post :create, params: { collaboration: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(collaboration_url(Collaboration.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new collaboration' do
        post :create, params: { collaboration: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          message: 'Test message',
          requester_id: 1,
          requestee_id: 1,
          requester_goal_id: 1,
          requestee_goal_id: 1,
          request_status_id: 1
        }
      }

      it 'updates the requested collaboration' do
        collaboration = Collaboration.create! valid_attributes
        put :update, params: { id: collaboration.to_param, collaboration: new_attributes }, session: valid_session
        collaboration.reload
        expect(collaboration.requester_id).to eq(1)
        expect(collaboration.requestee_id).to eq(1)
        expect(collaboration.requester_goal_id).to eq(1)
        expect(collaboration.requestee_goal_id).to eq(1)
        expect(collaboration.request_status_id).to eq(1)
      end

      it 'renders a JSON response with the updated collaboration' do
        collaboration = Collaboration.create! valid_attributes
        put :update, params: { id: collaboration.to_param, collaboration: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated collaboration' do
        collaboration = Collaboration.create! valid_attributes
        put :update, params: { id: collaboration.to_param, collaboration: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested collaboration' do
      collaboration = Collaboration.create! valid_attributes
      expect {
        delete :destroy, params: { id: collaboration.to_param }, session: valid_session
      }.to change(Collaboration, :count).by(-1)
    end
  end
end
