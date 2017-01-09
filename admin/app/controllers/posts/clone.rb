module App
  module Controllers
    module Posts
      class Clone < Posts::Base
        def call(params)
          result = Post::Clone.(params)
          if result.success?
            add_flash_message "Cloned Post: #{result['model'].title}", 'success'
            redirect_to Router.path(:edit_post, id: result['model'].id)
          else
            add_flash_message "Error cloning Post: #{result['model'].title}", 'error'
            redirect_to Router.path(:edit_post, id: params[:id])
          end
        end
      end
    end
  end
end