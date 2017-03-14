class Post < Sequel::Model(DB)
  class PagedList < Trailblazer::Operation
    PER_PAGE = 3

    step :setup!
    step :get_posts!, name: 'posts.get'

    def setup!(options, params:, **)
      params[:page] = 1 if params[:page].nil?
      params[:page] = params[:page].to_i
    end

    def get_posts!(options, params:, **)
      posts_query = Post.dataset.where(active: true)
          .where(lang: params[:lang])
          .order(:activated_at).reverse

      if params[:tag]
        posts_query = posts_query.where(Sequel.like(:tags, "%#{params[:tag]}%"))
      end

      options['result.posts'] = posts_query.paginate(params[:page], PER_PAGE)
    end
  end

  class Sitemap < Trailblazer::Operation
    step :get_posts!

    def get_posts!(options, params:, **)
      options['result.posts'] = Post.dataset.where(active: true)
                                    .order(:activated_at).reverse
    end
  end
end