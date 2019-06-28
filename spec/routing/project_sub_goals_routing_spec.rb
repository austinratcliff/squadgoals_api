require 'rails_helper'

describe ProjectSubGoalsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/project_sub_goals').to route_to('project_sub_goals#index')
    end

    it 'routes to #show' do
      expect(:get => '/project_sub_goals/1').to route_to('project_sub_goals#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/project_sub_goals').to route_to('project_sub_goals#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/project_sub_goals/1').to route_to('project_sub_goals#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/project_sub_goals/1').to route_to('project_sub_goals#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/project_sub_goals/1').to route_to('project_sub_goals#destroy', :id => '1')
    end
  end
end
