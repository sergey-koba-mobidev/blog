require 'hanami/controller'

module App
  module Controllers
    module Posts
      class Index < BaseAction
        def call(params)
          render_layout Post::Cell::List.new(nil, collection: Post.all)
        end
      end
    end
  end
end