require 'rails_helper'

describe CheersController do
  let(:valid_attributes) {
    {
      user_id: 0,
      goal_id: 0
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      cheer = Cheer.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      cheer = Cheer.create! valid_attributes
      get :show, params: { id: cheer.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new cheer' do
        expect {
          post :create, params: { cheer: valid_attributes }, session: valid_session
        }.to change(Cheer, :count).by(1)
      end

      it 'renders a JSON response with the new cheer' do
        post :create, params: { cheer: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(cheer_url(Cheer.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new cheer' do
        post :create, params: { cheer: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          user_id: 1,
          goal_id: 1
        }
      }

      it 'updates the requested cheer' do
        cheer = Cheer.create! valid_attributes
        put :update, params: { id: cheer.to_param, cheer: new_attributes }, session: valid_session
        cheer.reload
        expect(cheer.user_id).to eq(1)
        expect(cheer.goal_id).to eq(1)
      end

      it 'renders a JSON response with the updated cheer' do
        cheer = Cheer.create! valid_attributes
        put :update, params: { id: cheer.to_param, cheer: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated cheer' do
        cheer = Cheer.create! valid_attributes
        put :update, params: { id: cheer.to_param, cheer: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested cheer' do
      cheer = Cheer.create! valid_attributes
      expect {
        delete :destroy, params: { id: cheer.to_param }, session: valid_session
      }.to change(Cheer, :count).by(-1)
    end
  end
end
