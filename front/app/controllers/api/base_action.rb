module Api
  module Controllers
    class BaseAction
      def self.inherited(child_class)
        child_class.include Hanami::Action
        child_class.include Hanami::Action::Session
        child_class.before :authenticate!
      end

      protected

      def authenticate!
        halt 401 unless params[:api_token] == Constants::api_token
      end

      def render_json(body, status = 200)
        self.body = body.to_json
        self.status = status
      end
    end
  end
end