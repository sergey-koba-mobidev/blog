module App
  module Controllers
    class BaseAction
      include Trailblazer::Operation::Controller

      def self.inherited(child_class)
        child_class.include Hanami::Action
      end

      protected

      def render_layout(content = '')
        self.body = Html::Cell::Layout.new.() { content }
      end
    end
  end
end