class Post < Sequel::Model(DB)
  class Cell
    class Base < BaseCell
      def post_date
        l model.created_at, :human
      end

      def tags
        model.tags.split(',').map { |t| t.strip }
      end
    end
  end
end