require 'rails_helper'

describe CheersController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/cheers').to route_to('cheers#index')
    end

    it 'routes to #show' do
      expect(:get => '/cheers/1').to route_to('cheers#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/cheers').to route_to('cheers#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/cheers/1').to route_to('cheers#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/cheers/1').to route_to('cheers#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/cheers/1').to route_to('cheers#destroy', :id => '1')
    end
  end
end
