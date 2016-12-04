class Post < Sequel::Model(DB)
  class Cell
    class List < Trailblazer::Cell
      include ::Cell::Erb

      def posts
        @options[:collection]
      end

      def show
        render
      end
    end
  end
end