module App
  module Controllers
    module Sessions
      class New < BaseAction
        def call(params)
          render_layout User::Cell::Login.(User::FindForAuth['contract.default'])
        end
      end
    end
  end
end