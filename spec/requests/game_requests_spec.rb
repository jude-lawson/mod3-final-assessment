require 'rails_helper'

RSpec.describe 'Game Requests' do
  let(:game_data) { File.read('spec/fixtures/game.json') }

  before :each do
    @josh = User.create(id: 1, name: "Josh")
    @sal = User.create(id: 2, name: "Sal")

    @game = Game.create!(id: 1, player_1: @josh, player_2: @sal)

    @play_1 = @josh.plays.create(game: @game, word: "sal", score: 3)
    @play_2 = @josh.plays.create(game: @game, word: "zoo", score: 12)
    @play_3 = @sal.plays.create(game: @game, word: "josh", score: 14)
    @play_4 = @sal.plays.create(game: @game, word: "no", score: 2)
  end


  context '/api/v1/games/1' do
    it 'should return the game data for the specified game' do
      get "/api/v1/games/#{@game.id}"
      # response_data = JSON.parse(response.body) 
      response_data = JSON.parse(response.body)
      expected_data = JSON.parse(game_data)

      expect(response_data).to eq(expected_data)
    end
  end
end
