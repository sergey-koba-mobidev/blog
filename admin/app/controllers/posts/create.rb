module App
  module Controllers
    module Posts
      class Create < Posts::Base
        def call(params)
          result = Post::Create.(params.env['rack.request.form_hash'])
          if result.success?
            add_flash_message "Created a Post: #{result['model'].title}", 'success'
            redirect_to '/'
          else
            render_layout Post::Cell::New.(result['contract.default'])
          end
        end
      end
    end
  end
end