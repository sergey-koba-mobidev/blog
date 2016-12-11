module Html
  module Cell
    class Layout < BaseCell
      def show(&block)
        render(&block)
      end
    end
  end
end