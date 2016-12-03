require 'hanami/controller'

module App
  module Controllers
    module Posts
      class New
        include Hanami::Action

        def call(params)
          self.body = 'OK'
        end
      end
    end
  end
end