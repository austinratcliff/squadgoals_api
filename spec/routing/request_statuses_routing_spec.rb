require 'rails_helper'

describe RequestStatusesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/request_statuses').to route_to('request_statuses#index')
    end

    it 'routes to #show' do
      expect(:get => '/request_statuses/1').to route_to('request_statuses#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/request_statuses').to route_to('request_statuses#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/request_statuses/1').to route_to('request_statuses#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/request_statuses/1').to route_to('request_statuses#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/request_statuses/1').to route_to('request_statuses#destroy', :id => '1')
    end
  end
end
