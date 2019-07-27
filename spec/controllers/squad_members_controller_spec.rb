require 'rails_helper'

describe SquadMembersController do
  austin = User.create(
    first_name: 'Austin',
    last_name: 'Ratcliff',
    name: 'Austin Ratcliff',
    email: 'austin@example.com',
    phone: '1234567890',
    password: 'password',
    password_confirmation: 'password'
  )

  tyle = User.create(
    first_name: 'Tyle',
    last_name: 'Bivens',
    name: 'Tyle Bivens',
    email: 'tyle@example.com',
    phone: '1234567890',
    password: 'password',
    password_confirmation: 'password'
  )

  squad = Squad.create(
    user_id: austin.id
  )

  let(:valid_attributes) {
    {
      squad_id: squad.id,
      member_id: tyle.id
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
        skip('Squad members cannot get updated')
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
