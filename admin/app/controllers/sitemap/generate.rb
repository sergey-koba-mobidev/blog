require_relative '../base_action'

module App
  module Controllers
    module Sitemap
      class Generate < BaseAction
        before :authenticate

        def call(params)
          result = ::Sitemap::Generate.()
          if result.success?
            add_flash_message 'Sitemap generated', 'success'
          else
            error = 'Api request error'
            error = JSON.parse(result['result.response'].body)['error'] if result['result.response'].status == 500
            error = 'Api authentication error' if result['result.response'].status == 401
            add_flash_message error, 'error'
          end
          redirect_to Router.path(:sitemap)
        end
      end
    end
  end
end