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
        configure do
          config.messages_file = 'config/error_messages.yml'
          option :form

          def unique?(value)
            Post.exclude(id: form.model.id).where(slug: value).first.nil?
          end
        end

        required(:title).filled
        required(:content).filled
        required(:slug).filled
        required(:slug).filled(:unique?)
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
      model.activated_at = timestamp
    end
  end

  class Update < Create
    model Post, :update

    contract do
      property :id
      property :activated_at
      validation do
        required(:activated_at).filled
      end
    end

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