require 'rails_helper'

describe TagsController do
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
      tag = Tag.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      tag = Tag.create! valid_attributes
      get :show, params: { id: tag.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new tag' do
        expect {
          post :create, params: { tag: valid_attributes }, session: valid_session
        }.to change(Tag, :count).by(1)
      end

      it 'renders a JSON response with the new tag' do
        post :create, params: { tag: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(tag_url(Tag.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new tag' do
        post :create, params: { tag: invalid_attributes }, session: valid_session
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

      it 'updates the requested tag' do
        tag = Tag.create! valid_attributes
        put :update, params: { id: tag.to_param, tag: new_attributes }, session: valid_session
        tag.reload
        expect(tag.name).to eq('New name')
      end

      it 'renders a JSON response with the updated tag' do
        tag = Tag.create! valid_attributes
        put :update, params: { id: tag.to_param, tag: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated tag' do
        tag = Tag.create! valid_attributes
        put :update, params: { id: tag.to_param, tag: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested tag' do
      tag = Tag.create! valid_attributes
      expect {
        delete :destroy, params: { id: tag.to_param }, session: valid_session
      }.to change(Tag, :count).by(-1)
    end
  end
end
