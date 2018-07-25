class Api::V1::PlaysController < Api::V1::ApplicationController
  def create
    game = Game.find(params[:id])
    user = User.find(params[:user_id])
    user.plays.create!(game: game, word: params[:word])
    render status: 201, json: game
  end
end
