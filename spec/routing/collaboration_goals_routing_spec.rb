require 'rails_helper'

describe CollaborationGoalsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/collaboration_goals').to route_to('collaboration_goals#index')
    end

    it 'routes to #show' do
      expect(:get => '/collaboration_goals/1').to route_to('collaboration_goals#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/collaboration_goals').to route_to('collaboration_goals#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/collaboration_goals/1').to route_to('collaboration_goals#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/collaboration_goals/1').to route_to('collaboration_goals#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/collaboration_goals/1').to route_to('collaboration_goals#destroy', :id => '1')
    end
  end
end
