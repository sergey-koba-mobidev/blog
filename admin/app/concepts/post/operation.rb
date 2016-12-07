class Post < Sequel::Model(DB)
  class Create < Trailblazer::Operation
    include Model
    model Post, :create

    contract do
      property :title
      property :content

      validation do
        required(:title).filled
        required(:content).filled
      end
    end

    def process(params)
      validate(params) do
        set_timestamps
        contract.save
      end
    end

    private

    def set_timestamps
      timestamp = Time.now
      model.created_at = timestamp
      model.updated_at = timestamp
    end
  end

  class Destroy < Trailblazer::Operation

    def process(params)
      model = Post.find(id: params[:id])
      model.destroy
    end
  end

  class PagedList < Trailblazer::Operation
    PER_PAGE = 5

    def setup!(params)
      params[:page] = 1 if params[:page].nil?
      params[:page] = params[:page].to_i
      super
    end

    def process(params)
      @model = Post.dataset.paginate(params[:page], PER_PAGE)
    end
  end
end