require 'rails_helper'

RSpec.describe Sentence do
  let(:sentence_data) {
    JSON.parse(File.read('spec/fixtures/sentences.json'))['results'][0]['lexicalEntries'][0]['sentences'][0]
  }
  it 'should have the correct attributes' do
    sentence = Sentence.new(sentence_data)

    expect(sentence.text).to eq(sentence_data['text'])
  end
end
