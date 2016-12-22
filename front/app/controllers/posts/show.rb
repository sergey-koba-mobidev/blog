module App
  module Controllers
    module Posts
      class Show < BaseAction
        def call(params)
          post = Post.find(slug: params[:slug])
          render_layout Post::Cell::Show.new(post, host: params.env['HTTP_HOST']),
              seo_title: post.title,
              seo_description: post.seo_description,
              seo_keywords: post.seo_keywords
        end
      end
    end
  end
end