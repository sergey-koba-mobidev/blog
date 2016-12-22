module App
  module Controllers
    class BaseAction
      include Trailblazer::Operation::Controller

      def self.inherited(child_class)
        child_class.include Hanami::Action
        child_class.include Hanami::Action::Session
      end

      protected

      def render_layout(content = '', options = {})
        self.body = Html::Cell::Layout.new(nil, options).() { content }
      end
    end
  end
end