require 'rails_helper'

describe TaggingsController do
  austin = User.create(
    first_name: 'Austin',
    last_name: 'Ratcliff',
    name: 'Austin Ratcliff',
    email: 'austin@example.com',
    phone: '1234567890',
    password: 'password',
    password_confirmation: 'password'
  )

  category = Category.create(
    name: 'Career'
  )

  goal_austin = Goal.create(
    user_id: austin.id,
    category_id: category.id,
    content: 'Code something.',
    by_when: DateTime.now,
    is_private: false
  )

  tag_austin = Tag.create(
    name: 'Software'
  )

  let(:valid_attributes) {
    {
      goal_id: goal_austin.id,
      tag_id: tag_austin.id
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      tagging = Tagging.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      tagging = Tagging.create! valid_attributes
      get :show, params: { id: tagging.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new tagging' do
        expect {
          post :create, params: { tagging: valid_attributes }, session: valid_session
        }.to change(Tagging, :count).by(1)
      end

      it 'renders a JSON response with the new tagging' do
        post :create, params: { tagging: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(tagging_url(Tagging.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new tagging' do
        post :create, params: { tagging: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        skip('Taggings cannot get updated')
      }

      it 'updates the requested tagging' do
        tagging = Tagging.create! valid_attributes
        put :update, params: { id: tagging.to_param, tagging: new_attributes }, session: valid_session
        tagging.reload
        expect(tagging.goal_id).to eq(1)
        expect(tagging.tag_id).to eq(1)
      end

      it 'renders a JSON response with the updated tagging' do
        tagging = Tagging.create! valid_attributes
        put :update, params: { id: tagging.to_param, tagging: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated tagging' do
        tagging = Tagging.create! valid_attributes
        put :update, params: { id: tagging.to_param, tagging: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested tagging' do
      tagging = Tagging.create! valid_attributes
      expect {
        delete :destroy, params: { id: tagging.to_param }, session: valid_session
      }.to change(Tagging, :count).by(-1)
    end
  end
end
