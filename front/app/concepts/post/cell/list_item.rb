class Post < Sequel::Model(DB)
  class Cell
    class ListItem < BaseCell
      property :id
      property :title
      property :slug
      property :seo_description
      property :seo_keywords
      property :created_at
      property :updated_at

      def post_date
        model.created_at.strftime('%b %d, %Y')
      end

      def tags
        model.tags.split(',')
      end

      def content
        model.content.split('---read-more---')[0]
      end
    end
  end
end