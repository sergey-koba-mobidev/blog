module App
  module Controllers
    module Sessions
      class Create < BaseAction
        def call(params)
          run User::FindForAuth, params: params.env['rack.request.form_hash'] do |op|
            session[:user] = {id: op.model.id, hash: op.model.password[0..30]}
            redirect_to '/'
          end
          render_layout User::Cell::Login.(@form)
        end
      end
    end
  end
end