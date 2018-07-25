class Presenter
  def initialize(params)
    @params = params
    @oxford = OxfordService.new
  end

  def sentence_suggestions
    suggestions = Suggestions.new(@oxford.get_suggested_sentences(word))
    suggestions.suggested_sentences
  end

  def word
    @params[:word]
  end
end
