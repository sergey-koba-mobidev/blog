require_relative '../base_action'

module Api
  module Controllers
    module Sitemap
      class Generate < BaseAction
        def call(params)
          result = ::Sitemap::Generate.()
          if result.success?
            render_json({success: 'Sitemap::Generate success'})
          else
            render_json({error: 'Sitemap::Generate failed'}, 500)
          end
        end
      end
    end
  end
end