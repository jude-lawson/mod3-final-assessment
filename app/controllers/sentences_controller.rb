class SentencesController < ApplicationController
  def index
    @word = params[:word]
    domain = Faraday.new('https://od-api.oxforddictionaries.com')
    response = domain.get('/api/v1/entries/en/mindfulness/sentences') do |request|
      request.headers['Accept'] = 'application/json'
      request.headers['app_id'] = ENV['OXFORD_APP_ID'] 
      request.headers['app_key'] = ENV['OXFORD_API_KEY'] 
    end
    suggestions = Suggestions.new(JSON.parse(response.body))
    @suggestions = suggestions.suggested_sentences
  end
end

class Suggestions
  def initialize(response_data)
    @data = response_data
  end

  def suggested_sentences
    filtered_data = @data['results'][0]['lexicalEntries'][0]['sentences'].select do |sentence_data|
      sentence_data['regions'].include?('North American')
    end
    
    filtered_data.map do |data|
      Sentence.new(data)
    end
  end
end

class Sentence
  attr_reader :text, :region

  def initialize(sentence_data)
    @text = sentence_data['text']
    @region = sentence_data['regions'][0]
  end
end
