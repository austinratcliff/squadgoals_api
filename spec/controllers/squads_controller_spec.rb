require 'rails_helper'

describe SquadsController do
  let(:valid_attributes) {
    {
      user_id: 0,
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      squad = Squad.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      squad = Squad.create! valid_attributes
      get :show, params: { id: squad.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new squad' do
        expect {
          post :create, params: { squad: valid_attributes }, session: valid_session
        }.to change(Squad, :count).by(1)
      end

      it 'renders a JSON response with the new squad' do
        post :create, params: { squad: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(squad_url(Squad.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new squad' do
        post :create, params: { squad: invalid_attributes }, session: valid_session
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
        }
      }

      it 'updates the requested squad' do
        squad = Squad.create! valid_attributes
        put :update, params: { id: squad.to_param, squad: new_attributes }, session: valid_session
        squad.reload
        expect(squad.user_id).to eq(1)
      end

      it 'renders a JSON response with the updated squad' do
        squad = Squad.create! valid_attributes
        put :update, params: { id: squad.to_param, squad: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated squad' do
        squad = Squad.create! valid_attributes
        put :update, params: { id: squad.to_param, squad: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested squad' do
      squad = Squad.create! valid_attributes
      expect {
        delete :destroy, params: { id: squad.to_param }, session: valid_session
      }.to change(Squad, :count).by(-1)
    end
  end
end
