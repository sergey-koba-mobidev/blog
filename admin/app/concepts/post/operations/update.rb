class Post < Sequel::Model(DB)
  class Update < Create
    step Model(Post, :find_by)
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
end