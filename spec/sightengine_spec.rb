require 'spec_helper'

describe Sightengine, vcr: true do
  it 'has a version number' do
    expect(Sightengine::VERSION).not_to be nil
  end

  it 'returns the result of moderating an image' do
    result = Sightengine.moderate('https://unsplash.it/200/300?random')
    expect(result.status).to eq('success')
    expect(result.nudity_result).to be_falsy
    expect(result.nudity_confidence).to eq(78)
  end
end
