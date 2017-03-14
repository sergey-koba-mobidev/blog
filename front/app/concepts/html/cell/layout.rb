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
        lang_label = lang == 'ru' ? 'Ru' : 'Eng'
        link_to lang_label, "#{DEFAULT_LANG == lang ? '/' : "/#{lang}"}", class: "b-languages-list__link #{R18n.get.locale.code == lang ? 'active' : ''}"
      end

      def tag
        options[:tag]
      end

      def show(&block)
        render(&block)
      end
    end
  end
end