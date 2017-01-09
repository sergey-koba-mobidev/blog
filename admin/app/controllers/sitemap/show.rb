require_relative '../base_action'

module App
  module Controllers
    module Sitemap
      class Show < BaseAction
        before :authenticate

        def call(params)
          render_layout ::Sitemap::Cell::Show.(nil, posts_count: Post.where(active: true).count)
        end
      end
    end
  end
end