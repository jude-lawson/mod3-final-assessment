class SentencesController < ApplicationController
  def index
    @word = params[:word]
    # domain = Faraday.new('https://od-api.oxforddictionaries.com')
    # response = domain.get('/api/v1/entries/en/mindfulness/sentences') do |request|
    #   request.headers['Accept'] = 'application/json'
    #   request.headers['app_id'] = ENV['OXFORD_APP_ID'] 
    #   request.headers['app_key'] = ENV['OXFORD_API_KEY'] 
    # end
    # suggestions = Suggestions.new(JSON.parse(response.body))
    oxford = OxfordService.new
    suggestions = Suggestions.new(oxford.get_suggested_sentences(params[:word]))
    @suggestions = suggestions.suggested_sentences
  end
end
