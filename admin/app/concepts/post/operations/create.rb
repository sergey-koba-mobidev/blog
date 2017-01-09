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
end