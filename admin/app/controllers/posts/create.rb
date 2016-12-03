require 'hanami/controller'
require 'trailblazer/operation/controller'

module App
  module Controllers
    module Posts
      class Create
        include Hanami::Action
        include Trailblazer::Operation::Controller

        def call(params)
          self.body = 'be'
          run Post::Create, params: params.env['rack.request.form_hash'] do |op|
            self.body = 'OK'
          end
          puts @form.errors.messages
        end
      end
    end
  end
end