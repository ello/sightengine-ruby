require 'sightengine/version'

require 'net/http'
require 'json'
require 'forwardable'

module Sightengine
  extend SingleForwardable

  class << self
    def client(service_url = 'https://api.sightengine.com/1.0',
                api_user = ENV['SIGHTENGINE_API_USER'],
                api_secret = ENV['SIGHTENGINE_API_SECRET'])
      @client ||= Client.new(service_url, api_user, api_secret)
    end

    def client=(client)
      @client = client
    end
  end

  def_delegators :client, :moderate

  Response = Struct.new(:status, :nudity_result, :nudity_confidence) do

    def self.from_json(json)
      new(json['status'],
          json.dig('nudity', 'result'),
          json.dig('nudity', 'confidence'))
    end
  end

  class Client
    def initialize(service_uri, user, secret)
      @service_uri  = service_uri
      @user         = user
      @secret       = secret
    end

    def moderate(url)
      http_client(path: '/nudity.json', http_verb: 'GET', params: { url: url })
    end

    private

    def http_client(path:, http_verb:, body: "", params: {})
      uri     = URI(@service_uri + "#{path}")
      uri.query = URI.encode_www_form(params.merge(api_user: @user, api_secret: @secret))
      http    = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      request = create_request(http_verb).new(uri)
      request.body = body
      request.add_field 'Accept', 'application/json'
      response = http.request(request)
      Response.from_json(JSON.parse(response.body))
    end

    def create_request(verb)
      case verb.downcase
        when 'get'
          Net::HTTP::Get
        when 'post'
          Net::HTTP::Post
      end
    end
  end
end
