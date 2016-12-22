module Html
  module Cell
    class Layout < BaseCell
      def seo_title
        options[:seo_title] || t.seo.title
      end

      def seo_description
        options[:seo_description] || t.seo.description
      end

      def seo_keywords
        options[:seo_keywords] || t.seo.keywords
      end

      def show(&block)
        render(&block)
      end
    end
  end
end