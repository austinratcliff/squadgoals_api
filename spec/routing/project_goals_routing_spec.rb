require 'rails_helper'

describe ProjectGoalsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/project_goals').to route_to('project_goals#index')
    end

    it 'routes to #show' do
      expect(:get => '/project_goals/1').to route_to('project_goals#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/project_goals').to route_to('project_goals#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/project_goals/1').to route_to('project_goals#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/project_goals/1').to route_to('project_goals#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/project_goals/1').to route_to('project_goals#destroy', :id => '1')
    end
  end
end
