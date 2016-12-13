class Post < Sequel::Model(DB)
  class Cell
    class Show < BaseCell
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
        model.content.gsub! '---read-more---', ''
      end
    end
  end
end