require 'rails_helper'

describe TaggingsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/taggings').to route_to('taggings#index')
    end

    it 'routes to #show' do
      expect(:get => '/taggings/1').to route_to('taggings#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/taggings').to route_to('taggings#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/taggings/1').to route_to('taggings#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/taggings/1').to route_to('taggings#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/taggings/1').to route_to('taggings#destroy', :id => '1')
    end
  end
end
