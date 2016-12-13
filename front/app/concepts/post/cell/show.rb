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
        model.tags.split(',').map{ |t| t.strip }
      end

      def content
        model.content.gsub! '---read-more---', ''
      end

      def url
        "http://#{options[:host]}#{Router.path(:show_post, slug: model.slug)}"
      end

      def discus_identifier
        "#{model.id}-#{ENV['RACK_ENV']}"
      end
    end
  end
end