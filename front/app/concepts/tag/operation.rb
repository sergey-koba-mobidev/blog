require_relative '../post/operation.rb'
class Tag
  class PagedList < ::Post::PagedList
    step Nested(::Post::PagedList)
    step :get_posts!, replace: 'posts.get'

    def get_posts!(options, params:, **)
      options['result.posts'] = Post.dataset.where(active: true).where(Sequel.like(:tags, "%#{params[:tag]}%"))
                                    .where(lang: params[:lang])
                                    .order(:activated_at).reverse
                                    .paginate(params[:page], PER_PAGE)
    end
  end
end