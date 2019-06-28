require 'rails_helper'

describe SquadMembersController do
  let(:valid_attributes) {
    {
      squad_id: 0,
      member_id: 0
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      squad_member = SquadMember.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      squad_member = SquadMember.create! valid_attributes
      get :show, params: { id: squad_member.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new squad_member' do
        expect {
          post :create, params: { squad_member: valid_attributes }, session: valid_session
        }.to change(SquadMember, :count).by(1)
      end

      it 'renders a JSON response with the new squad_member' do
        post :create, params: { squad_member: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(squad_member_url(SquadMember.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new squad_member' do
        post :create, params: { squad_member: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          squad_id: 1,
          member_id: 1
        }
      }

      it 'updates the requested squad_member' do
        squad_member = SquadMember.create! valid_attributes
        put :update, params: { id: squad_member.to_param, squad_member: new_attributes }, session: valid_session
        squad_member.reload
        expect(squad_member.squad_id).to eq(1)
        expect(squad_member.member_id).to eq(1)
      end

      it 'renders a JSON response with the updated squad_member' do
        squad_member = SquadMember.create! valid_attributes
        put :update, params: { id: squad_member.to_param, squad_member: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated squad_member' do
        squad_member = SquadMember.create! valid_attributes
        put :update, params: { id: squad_member.to_param, squad_member: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested squad_member' do
      squad_member = SquadMember.create! valid_attributes
      expect {
        delete :destroy, params: { id: squad_member.to_param }, session: valid_session
      }.to change(SquadMember, :count).by(-1)
    end
  end
end
