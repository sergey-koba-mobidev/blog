module App
  module Controllers
    class BaseAction
      def self.inherited(child_class)
        child_class.include Hanami::Action
        child_class.include Hanami::Action::Session

        child_class.before :set_lang
      end

      protected

      def set_lang
        R18n.set(session[:lang]) unless session[:lang].nil?
      end

      def render_layout(content = '', options = {})
        self.body = Html::Cell::Layout.new(nil, options).() { content }
      end
    end
  end
end