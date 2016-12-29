class Post < Sequel::Model(DB)
  class Cell
    class ListItem < Base
      property :id
      property :title
      property :slug
      property :seo_description
      property :seo_keywords
      property :created_at
      property :updated_at
      property :activated_at

      def content
        model.content.split('---read-more---')[0]
      end
    end
  end
end