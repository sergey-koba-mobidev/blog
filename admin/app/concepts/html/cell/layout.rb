module Html
  module Cell
    class Layout < BaseCell
      def current_user
        @options[:current_user]
      end

      def show(&block)
        render(&block)
      end
    end
  end
end