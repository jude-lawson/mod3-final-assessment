require 'rails_helper'

RSpec.describe Suggestions do
  let(:results_data) { File.read('spec/fixtures/sentences.json') }

  it 'should return all sentences as Sentence object from given parsed response data' do
    suggestions = Suggestions.new(JSON.parse(results_data))

    suggestions.suggested_sentences.each do |sentence|
      expect(sentence).to be_a(Sentence)
    end
  end
end
