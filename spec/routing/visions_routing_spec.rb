require 'rails_helper'

describe VisionsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/visions').to route_to('visions#index')
    end

    it 'routes to #show' do
      expect(:get => '/visions/1').to route_to('visions#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/visions').to route_to('visions#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/visions/1').to route_to('visions#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/visions/1').to route_to('visions#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/visions/1').to route_to('visions#destroy', :id => '1')
    end
  end
end
