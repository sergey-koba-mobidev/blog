module App
  module Controllers
    module Posts
      class New < BaseAction
        def call(params)
          render_layout Post::Cell::New.(Post.new)
        end
      end
    end
  end
end