class Post < Sequel::Model(DB)
  class PagedList < Trailblazer::Operation
    PER_PAGE = 5

    step :setup!
    step :get_posts!, name: 'posts.get'

    def setup!(options, params:, **)
      params[:page] = 1 if params[:page].nil?
      params[:page] = params[:page].to_i
    end

    def get_posts!(options, params:, **)
      options['result.posts'] = Post.dataset.where(active: true)
                                    .where(lang: params[:lang])
                                    .order(:activated_at).reverse
                                    .paginate(params[:page], PER_PAGE)
    end
  end
end