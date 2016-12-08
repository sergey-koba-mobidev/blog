module App
  module Controllers
    module Sessions
      class New < BaseAction
        def call(params)
          form User::FindForAuth
          render_layout User::Cell::Login.(@form)
        end
      end
    end
  end
end