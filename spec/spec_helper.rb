$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sightengine'

require 'dotenv'
Dotenv.load

require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<SIGHTENGINE_API_USER>') { ENV['SIGHTENGINE_API_USER'] }
  c.filter_sensitive_data('<SIGHTENGINE_API_SECRET>') { ENV['SIGHTENGINE_API_SECRET'] }
  c.default_cassette_options = {
    match_requests_on: [
      :method,
      VCR.request_matchers.uri_without_params(:api_user, :api_secret)
    ]
  }
end

require 'pry'
