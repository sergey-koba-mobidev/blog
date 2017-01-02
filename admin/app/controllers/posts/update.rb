module App
  module Controllers
    module Posts
      class Update < Posts::Base
        def call(params)
          result = Post::Update.(params.env['rack.request.form_hash'].merge!(id: params[:id]))
          if result.success?
            add_flash_message "Updated a Post: #{result['model'].title}", 'success'
            redirect_to Router.path(:edit_post, id: params[:id])
          else
            render_layout Post::Cell::Edit.(result['contract.default'])
          end
        end
      end
    end
  end
end