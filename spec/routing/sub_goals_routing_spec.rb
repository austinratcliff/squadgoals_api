require 'rails_helper'

describe SubGoalsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/sub_goals').to route_to('sub_goals#index')
    end

    it 'routes to #show' do
      expect(:get => '/sub_goals/1').to route_to('sub_goals#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/sub_goals').to route_to('sub_goals#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/sub_goals/1').to route_to('sub_goals#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/sub_goals/1').to route_to('sub_goals#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/sub_goals/1').to route_to('sub_goals#destroy', :id => '1')
    end
  end
end
