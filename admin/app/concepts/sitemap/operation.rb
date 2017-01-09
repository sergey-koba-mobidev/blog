module Sitemap
  class Generate < Trailblazer::Operation
    step :send_generate!

    def send_generate!(options)
      options['result.response'] = Faraday.new.get do |req|
        req.url Constants::frontend_api_url + '/sitemap/generate'
        req.params['api_token'] = Constants::api_token
      end
      options['result.response'].status == 200
    end
  end
end