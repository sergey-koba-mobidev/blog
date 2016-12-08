module App
  module Controllers
    module Sessions
      class Destroy < BaseAction
        def call(params)
          session[:user] = nil
          redirect_to Router.path(:login)
        end
      end
    end
  end
end