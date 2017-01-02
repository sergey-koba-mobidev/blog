module App
  module Controllers
    class BaseAction
      def self.inherited(child_class)
        child_class.include Hanami::Action
        child_class.include Hanami::Action::Session
      end

      protected

      def current_user
        u = nil
        if !session[:user].nil? && !session[:user][:id].nil? && !session[:user][:hash].nil?
          u = User[session[:user][:id]]
          if u && u.password[0..30] != session[:user][:hash]
            u, session[:user] = nil, nil
          end
        end
        u
      end

      def authenticate
        redirect_to Router.path(:login) unless current_user
      end

      def add_flash_message(message, type = 'info')
        session[:flashes] ||= []
        session[:flashes] << OpenStruct.new({message: message, type: type})
      end

      def render_layout(content = '')
        self.body = Html::Cell::Layout.new(nil, current_user: current_user, flashes: session.delete(:flashes)).() { content }
      end
    end
  end
end