require 'trailblazer'
require 'trailblazer/operation/model'

class Post < Sequel::Model(DB)
  class Create < Trailblazer::Operation
    include Model
    model Post, :create

    contract do
      property :title
      property :content

      validation do
        required(:title).filled
      end
    end

    def process(params)
      validate(params['post']) do
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
end