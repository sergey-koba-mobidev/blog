require 'hanami/controller'

module App
  module Controllers
    module Posts
      class Index
        include Hanami::Action

        def call(params)
          self.body = 'OK'
        end
      end
    end
  end
end