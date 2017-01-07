class Post < Sequel::Model(DB)
  class Create < Trailblazer::Operation
    extend Contract::DSL

    step Model(Post, :new)
    step Contract::Build()
    step Contract::Validate()
    step :set_timestamps
    step Contract::Persist()

    contract do
      property :title
      property :content
      property :slug
      property :seo_description
      property :seo_keywords
      property :tags
      property :active
      property :activated_at
      property :lang

      validation do
        configure do
          config.messages_file = 'config/error_messages.yml'
          option :form

          def unique?(value)
            Post.exclude(id: form.model.id).where(slug: value).where(lang: form.lang).first.nil?
          end
        end

        required(:title).filled
        required(:content).filled
        required(:slug).filled
        required(:slug).filled(:unique?)
        required(:lang).filled
      end
    end

    def set_timestamps(options, model:, **)
      timestamp = Time.now
      options['contract.default'].activated_at = timestamp if options['contract.default'].activated_at == ''
      model.created_at = timestamp
      model.updated_at = timestamp
    end
  end

  class Update < Create
    step Model( Post, :find_by )
    step Contract::Build()
    step Contract::Validate()
    step :set_timestamps
    step Contract::Persist()

    contract do
      property :id
      property :activated_at

      validation do
        required(:activated_at).filled
      end
    end

    def set_timestamps(options, model:, **)
      model.updated_at = Time.now
    end
  end

  class Destroy < Trailblazer::Operation
    step :process

    def process(options, params:)
      Post[params[:id]].destroy
    end
  end

  class PagedList < Trailblazer::Operation
    PER_PAGE = 10

    step :setup!
    step :get_posts!

    def setup!(options, params:)
      params[:page] = 1 if params[:page].nil?
      params[:page] = params[:page].to_i
    end

    def get_posts!(options, params:)
      options['result.posts'] = Post.dataset.order(:activated_at).reverse.paginate(params[:page], PER_PAGE)
    end
  end
end