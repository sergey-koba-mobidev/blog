class Post < Sequel::Model(DB)
  class Create < Trailblazer::Operation
    include Model
    model Post, :create

    contract do
      property :title
      property :content
      property :slug
      property :seo_description
      property :seo_keywords
      property :tags
      property :active

      validation do
        required(:title).filled
        required(:content).filled
        required(:slug).filled
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

  class Update < Create
    model Post, :update

    def model!(params)
      Post[params[:id]]
    end

    private

    def set_timestamps
      model.updated_at = Time.now
    end
  end

  class Destroy < Trailblazer::Operation
    def process(params)
      Post[params[:id]].destroy
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