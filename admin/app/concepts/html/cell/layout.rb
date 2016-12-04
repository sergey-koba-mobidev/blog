module Html
  module Cell
    class Layout < Trailblazer::Cell
      include ::Cell::Erb

      def show(&block)
        render(&block)
      end
    end
  end
end