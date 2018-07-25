require 'rails_helper'

RSpec.describe 'Game Requests' do
  let(:game_data) { File.read('spec/fixtures/game.json') }
  let(:updated_game_data) { File.read('spec/fixtures/updated_game.json')}

  before :each do
    @josh = User.create(id: 1, name: "Josh")
    @sal = User.create(id: 2, name: "Sal")

    @game = Game.create!(id: 1, player_1: @josh, player_2: @sal)

    @play_1 = @josh.plays.create(game: @game, word: "sal", score: 3)
    @play_2 = @josh.plays.create(game: @game, word: "zoo", score: 12)
    @play_3 = @sal.plays.create(game: @game, word: "josh", score: 14)
    @play_4 = @sal.plays.create(game: @game, word: "no", score: 2)
  end


  context 'GET /api/v1/games/1' do
    it 'should return the game data for the specified game' do
      get "/api/v1/games/#{@game.id}"
      # response_data = JSON.parse(response.body) 
      response_data = JSON.parse(response.body)
      expected_data = JSON.parse(game_data)

      expect(response).to be_successful
      expect(response_data).to eq(expected_data)
    end
  end

  context 'POST /api/v1/games/1/plays' do
    describe 'with user_id=1 and word=at' do
      it 'should respond with 201 Created Response and should update the score' do
        post '/api/v1/games/1/plays?user_id=1&word=at'


        response_data = JSON.parse(response.body)
        expected_data = JSON.parse(updated_game_data)
        
        expect(response.status).to eq(201)
        expect(response.message).to eq('Created')
        expect(response_data).to eq(expected_data)
      end
    end
  end
end
