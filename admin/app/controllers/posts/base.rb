module App
  module Controllers
    module Posts
      class Base < BaseAction
        def self.inherited(child_class)
          super
          child_class.before :authenticate
        end
      end
    end
  end
end