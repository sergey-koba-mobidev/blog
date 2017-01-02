module App
  module Controllers
    module Posts
      class Destroy < Posts::Base
        def call(params)
          result = Post::Destroy.(id: params[:id])
          if result.success?
            add_flash_message 'Deleted a Post.', 'success'
          else
            add_flash_message 'Cannot delete a Post.', 'error'
          end
          redirect_to '/'
        end
      end
    end
  end
end