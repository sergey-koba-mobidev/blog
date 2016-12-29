class Post < Sequel::Model(DB)
  class PagedList < Trailblazer::Operation
    PER_PAGE = 5

    def setup!(params)
      params[:page] = 1 if params[:page].nil?
      params[:page] = params[:page].to_i
      super
    end

    def process(params)
      @model = Post.dataset.where(active: true).order(:activated_at).reverse.paginate(params[:page], PER_PAGE)
    end
  end
end