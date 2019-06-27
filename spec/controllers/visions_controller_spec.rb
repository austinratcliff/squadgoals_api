require 'rails_helper'

describe VisionsController do
  let(:valid_attributes) {
    {
      user_id: 0,
      statement: 'Test statement',
      timeframe: 0
    }
  }

  let(:invalid_attributes) {
    skip('To-do: Fix NotNullViolation')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a successful response' do
      vision = Vision.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      vision = Vision.create! valid_attributes
      get :show, params: { id: vision.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new vision' do
        expect {
          post :create, params: { vision: valid_attributes }, session: valid_session
        }.to change(Vision, :count).by(1)
      end

      it 'renders a JSON response with the new vision' do
        post :create, params: { vision: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(vision_url(Vision.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new vision' do
        post :create, params: { vision: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          user_id: 0,
          statement: 'New statement',
          timeframe: 0
        }
      }

      it 'updates the requested vision' do
        vision = Vision.create! valid_attributes
        put :update, params: { id: vision.to_param, vision: new_attributes }, session: valid_session
        vision.reload
        expect(vision.statement).to eq('New statement')
      end

      it 'renders a JSON response with the updated vision' do
        vision = Vision.create! valid_attributes
        put :update, params: { id: vision.to_param, vision: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated vision' do
        vision = Vision.create! valid_attributes
        put :update, params: { id: vision.to_param, vision: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested vision' do
      vision = Vision.create! valid_attributes
      expect {
        delete :destroy, params: { id: vision.to_param }, session: valid_session
      }.to change(Vision, :count).by(-1)
    end
  end
end
