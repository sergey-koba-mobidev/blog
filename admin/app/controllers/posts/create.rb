module App
  module Controllers
    module Posts
      class Create < Posts::Base
        def call(params)
          run Post::Create, params: params.env['rack.request.form_hash'] do |op|
            redirect_to '/'
          end
          render_layout Post::Cell::New.(@form)
        end
      end
    end
  end
end