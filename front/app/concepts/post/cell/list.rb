class Post < Sequel::Model(DB)
  class Cell
    class List < BaseCell
      def posts
        @options[:collection]
      end
    end
  end
end