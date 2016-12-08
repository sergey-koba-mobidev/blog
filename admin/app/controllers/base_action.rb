module App
  module Controllers
    class BaseAction
      include Trailblazer::Operation::Controller

      def self.inherited(child_class)
        child_class.include Hanami::Action
        child_class.include Hanami::Action::Session
      end

      protected

      def current_user
        u = nil
        if !session[:user].nil? && !session[:user][:id].nil? && !session[:user][:hash].nil?
          u = User[session[:user][:id]]
          u = nil if u && u.password[0..30] != session[:user][:hash]
        end
        u
      end

      def authenticate
        redirect_to Router.path(:login) unless current_user
      end

      def render_layout(content = '')
        self.body = Html::Cell::Layout.new(nil, current_user: current_user).() { content }
      end
    end
  end
end