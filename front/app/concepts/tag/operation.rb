class Tag
  class PagedList < ::Post::PagedList

    def process(params)
      @model = Post.dataset.where(active: true).where(Sequel.like(:tags, "%#{params[:tag]}%"))
                   .order(:created_at).reverse.paginate(params[:page], PER_PAGE)
    end
  end
end