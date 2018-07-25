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
