module App
  module Controllers
    module Posts
      class Show < BaseAction
        def call(params)
          render_layout Post::Cell::Show.new(Post.find(slug: params[:slug]), host: params.env['HTTP_HOST'])
        end
      end
    end
  end
end