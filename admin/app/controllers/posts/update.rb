module App
  module Controllers
    module Posts
      class Update < BaseAction
        def call(params)
          run Post::Update, params: params.env['rack.request.form_hash'].merge(id: params[:id]) do |op|
            redirect_to '/'
          end
          render_layout Post::Cell::Edit.(@form)
        end
      end
    end
  end
end