module App
  module Controllers
    module Posts
      class Update < Posts::Base
        def call(params)
          run Post::Update, params: params.env['rack.request.form_hash'].merge(id: params[:id]) do |op|
            add_flash_message 'Updated a Post.', 'success'
            redirect_to '/'
          end
          render_layout Post::Cell::Edit.(@form)
        end
      end
    end
  end
end