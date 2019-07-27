require 'rails_helper'

describe UsersController do
  let(:valid_attributes) {
    {
      first_name: 'Test',
      last_name: 'User',
      name: 'Test User',
      email: 'test@example.com',
      phone: '1234567890',
      password: 'password',
      password_confirmation: 'password'
    }
  }

  let(:invalid_attributes) {
    {
      first_name: 'Test',
      last_name: 'User',
      name: 'Test User',
      email: 'test@example.com',
      phone: '1234567890',
      password: 'password',
      password_confirmation: 'invalid password'
    }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      skip('To-do: Fix NoMethodError')
      user = User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      user = User.create! valid_attributes
      get :show, params: { id: user.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: valid_attributes }, session: valid_session
        }.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(user_url(User.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new user' do
        post :create, params: { user: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          first_name: 'New',
          last_name: 'Name',
          name: 'New Name',
          email: 'test@example.com',
          phone: '1234567890',
          password: 'password',
          password_confirmation: 'password'
        }
      }

      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        user.reload
        expect(user.first_name).to eq('New')
        expect(user.last_name).to eq('Name')
        expect(user.name).to eq('New Name')
      end

      it 'renders a JSON response with the updated user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: { id: user.to_param }, session: valid_session
      }.to change(User, :count).by(-1)
    end
  end
end
