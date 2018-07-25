class Api::V1::GamesController < Api::V1::ApplicationController
  def show
    game = Game.find(params[:id])
    render json: game
  end
end
