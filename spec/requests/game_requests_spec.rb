require 'rails_helper'

RSpec.describe 'Game Requests' do
  let(:game_data) { File.read('spec/fixtures/game.json') }
  context '/api/v1/games/1' do
    it 'should return the game data for the specified game' do
      get '/api/v1/games/1'

      response_data = JSON.parse(response.body)

      expect(response_data).to eq(game_data)
    end
  end
end
