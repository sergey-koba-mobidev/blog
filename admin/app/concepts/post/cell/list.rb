class Post < Sequel::Model(DB)
  class Cell
    class List < BaseCell
      def posts
        @options[:collection]
      end

      def pagination_base_url
        ''
      end

      def show
        render
      end
    end
  end
end