require_relative '../base_action'

module App
  module Controllers
    module Backup
      class Show < BaseAction
        before :authenticate

        def call(params)
          render_layout ::Backup::Cell::Show.(nil, posts_count: Post.count)
        end
      end
    end
  end
end