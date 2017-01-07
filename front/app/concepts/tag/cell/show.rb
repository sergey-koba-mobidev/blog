class Tag
  class Cell
    class Show < BaseCell
      def posts
        @options[:collection]
      end

      def tag
        model
      end

      def pagination_base_url
        "#{lang_base_url}/tag/#{tag}"
      end
    end
  end
end