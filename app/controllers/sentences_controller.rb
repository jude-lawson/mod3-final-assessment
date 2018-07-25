class SentencesController < ApplicationController
  def index
    @presenter = Presenter.new(params)
  end
end
