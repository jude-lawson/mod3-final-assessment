class Api::V1::GamesController < Api::V1::ApplicationController
  def show
    render json: {'hello' => 'yo'}
  end
end
