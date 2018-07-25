class Api::V1::PlaysController < Api::V1::ApplicationController
  def create
    render status: 201, json: {'hello' => 'yo'}
  end
end
