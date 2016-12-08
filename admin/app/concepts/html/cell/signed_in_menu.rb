module Html
  module Cell
    class SignedInMenu < BaseCell
      def current_user
        @options[:current_user]
      end
    end
  end
end