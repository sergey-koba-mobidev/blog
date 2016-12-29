class Post < Sequel::Model(DB)
  class Cell
    class Show < Base
      property :id
      property :title
      property :slug
      property :seo_description
      property :seo_keywords
      property :created_at
      property :updated_at
      property :activated_at


      def content
        c = model.content.gsub! '---read-more---', ''
        c.nil? ? model.content : c
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