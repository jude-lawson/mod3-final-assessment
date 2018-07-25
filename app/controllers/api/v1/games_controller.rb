class Api::V1::GamesController < Api::V1::ApplicationController
  def show
    # require 'pry';binding.pry

    render json: Game.find(params[:id])
  end
end
