module App
  module Controllers
    module Sessions
      class Create < BaseAction
        def call(params)
          result = User::FindForAuth.(params.env['rack.request.form_hash'])
          if result.success?
            session[:user] = {id: result['model'].id, hash: result['model'].password[0..30]}
            redirect_to '/'
          else
            render_layout User::Cell::Login.(result['contract.default'])
          end
        end
      end
    end
  end
end