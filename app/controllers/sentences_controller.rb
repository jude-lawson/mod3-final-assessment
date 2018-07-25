class SentencesController < ApplicationController
  def index
    @word = params[:word]
    domain = Faraday.new('https://od-api.oxforddictionaries.com')
    response = domain.get('/api/v1/entries/en/mindfulness/sentences') do |request|
      request.headers['Accept'] = 'application/json'
      request.headers['app_id'] = ENV['OXFORD_APP_ID'] 
      request.headers['app_key'] = ENV['OXFORD_API_KEY'] 
    end
    binding.pry
    suggestions = Suggestions.new(JSON.parse(response.body))
    # @suggestions = 
  end
end

class Suggestions
  def initialize(response_data)
    @data = response_data
  end

  def suggested_sentences
    @data['results'][0]['lexicalEntries'][0]['sentences'].select do |sentence_data|
      sentence_data['regions'].include?('north American')
    end   
  end
end
