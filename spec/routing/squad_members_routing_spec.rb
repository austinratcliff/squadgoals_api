require 'rails_helper'

describe SquadMembersController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/squad_members').to route_to('squad_members#index')
    end

    it 'routes to #show' do
      expect(:get => '/squad_members/1').to route_to('squad_members#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/squad_members').to route_to('squad_members#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/squad_members/1').to route_to('squad_members#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/squad_members/1').to route_to('squad_members#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/squad_members/1').to route_to('squad_members#destroy', :id => '1')
    end
  end
end
