require 'rails_helper'

=begin

As a guest user (no sign in required)
When I visit "/"
And I fill in a text box with "mindfulness"
And I click "Submit"
Then I should see a message that says "Examples for using 'mindfulness'"
And I should see a list of sentences with examples of how to use the word
And I should see only sentences for usage in North America
And I should not see sentences for any other regions

=end

RSpec.describe 'Example Sentences' do
  let(:sentences) {
    data = JSON.parse(File.read('spec/fixtures/sentences.json'))
    all_sentences = data['results'][0]['lexicalEntries'][0]['sentences']
    all_sentences.select do |sentence_data| 
      sentence_data['regions'].include?('North American')
    end
  }

  context 'As a guest' do
    it 'should return suggested sentences when I enter a word' do
      visit '/'

      fill_in :word, with: 'mindfulness'
      click_button 'Submit'

      expect(current_path).to eq('/suggested-sentences')
      expect(page).to have_content('Examples for using \'mindfulness\'')
      within('#suggested-sentences') do
        sentences.each do |sentence_data|
          expect(page).to have_content(sentence_data['text'])
        end

        page.find('.suggestion').each do |suggestion|
          expect(suggestion).to have_css("li[data-region='North American']")
        end
      end
    end
  end
end
