module Html
  module Cell
    class SignedInMenu < BaseCell
      def current_user
        @options[:current_user]
      end

      def logout_link
        link_to raw('<i class="fa fa-sign-out fa-fw"></i> Logout'), Router.path(:logout)
      end
    end
  end
end