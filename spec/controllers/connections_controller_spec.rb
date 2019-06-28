require 'rails_helper'

describe ConnectionsController do
  let(:valid_attributes) {
    {
      requester_id: 0,
      requestee_id: 0,
      request_status_id: 0
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      connection = Connection.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      connection = Connection.create! valid_attributes
      get :show, params: { id: connection.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new connection' do
        expect {
          post :create, params: { connection: valid_attributes }, session: valid_session
        }.to change(Connection, :count).by(1)
      end

      it 'renders a JSON response with the new connection' do
        post :create, params: { connection: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(connection_url(Connection.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new connection' do
        post :create, params: { connection: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          requester_id: 1,
          requestee_id: 1,
          request_status_id: 1
        }
      }

      it 'updates the requested connection' do
        connection = Connection.create! valid_attributes
        put :update, params: { id: connection.to_param, connection: new_attributes }, session: valid_session
        connection.reload
        expect(connection.requester_id).to eq(1)
        expect(connection.requestee_id).to eq(1)
        expect(connection.request_status_id).to eq(1)
      end

      it 'renders a JSON response with the updated connection' do
        connection = Connection.create! valid_attributes
        put :update, params: { id: connection.to_param, connection: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated connection' do
        connection = Connection.create! valid_attributes
        put :update, params: { id: connection.to_param, connection: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested connection' do
      connection = Connection.create! valid_attributes
      expect {
        delete :destroy, params: { id: connection.to_param }, session: valid_session
      }.to change(Connection, :count).by(-1)
    end
  end
end
