require 'rails_helper'

RSpec.describe 'Test Requests' do
  it 'should mock the web' do
    expect { Faraday.get('http://backend.turing.io') }.to raise_exception(WebMock::NetConnectNotAllowedError)
  end
end
