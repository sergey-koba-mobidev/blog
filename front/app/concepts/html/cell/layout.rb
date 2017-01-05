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

      def lang_link(lang)
        link_to lang, Router.path(:set_lang, lang: lang), class: "#{R18n.get.locale.code == lang ? 'active' : ''}"
      end

      def show(&block)
        render(&block)
      end
    end
  end
end