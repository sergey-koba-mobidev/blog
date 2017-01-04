require 'roar/decorator'
require 'roar/json'

class Post < Sequel::Model(DB)
  class Representer
    class Backup < Roar::Decorator
      include Roar::JSON

      property :id
      property :title
      property :content
      property :active
      property :slug
      property :seo_description
      property :seo_keywords
      property :tags
      property :created_at
      property :updated_at
      property :activated_at
    end
  end
end