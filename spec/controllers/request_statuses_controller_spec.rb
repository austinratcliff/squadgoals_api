require 'rails_helper'

describe RequestStatusesController do
  let(:valid_attributes) {
    {
      name: 'Test name'
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      request_status = RequestStatus.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      request_status = RequestStatus.create! valid_attributes
      get :show, params: { id: request_status.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new request_status' do
        expect {
          post :create, params: { request_status: valid_attributes }, session: valid_session
        }.to change(RequestStatus, :count).by(1)
      end

      it 'renders a JSON response with the new request_status' do
        post :create, params: { request_status: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(request_status_url(RequestStatus.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new request_status' do
        post :create, params: { request_status: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          name: 'New name'
        }
      }

      it 'updates the requested request_status' do
        request_status = RequestStatus.create! valid_attributes
        put :update, params: { id: request_status.to_param, request_status: new_attributes }, session: valid_session
        request_status.reload
        expect(request_status.name).to eq('New name')
      end

      it 'renders a JSON response with the updated request_status' do
        request_status = RequestStatus.create! valid_attributes
        put :update, params: { id: request_status.to_param, request_status: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated request_status' do
        request_status = RequestStatus.create! valid_attributes
        put :update, params: { id: request_status.to_param, request_status: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested request_status' do
      request_status = RequestStatus.create! valid_attributes
      expect {
        delete :destroy, params: { id: request_status.to_param }, session: valid_session
      }.to change(RequestStatus, :count).by(-1)
    end
  end
end
