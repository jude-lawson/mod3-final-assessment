class OxfordService
  def initialize
    @domain = Faraday.new('https://od-api.oxforddictionaries.com')
  end

  def get_suggested_sentences(word)
    response = @domain.get("/api/v1/entries/en/#{word}/sentences") do |request|
      request.headers['Accept'] = 'application/json'
      request.headers['app_id'] = ENV['OXFORD_APP_ID'] 
      request.headers['app_key'] = ENV['OXFORD_API_KEY'] 
    end

    JSON.parse(response.body)
  end
end
