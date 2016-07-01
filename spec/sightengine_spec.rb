require 'spec_helper'

describe Sightengine, vcr: true do
  it 'has a version number' do
    expect(Sightengine::VERSION).not_to be nil
  end

  it 'returns the result of moderating an image' do
    result = Sightengine.moderate('https://unsplash.it/200/300?random')
    expect(result).to eq({
      "status" => "success",
      "nudity" => {
        "result" => false,
        "confidence" => 78
      },
      "photo" => "https://unsplash.it/200/300?random"
    })
  end
end
