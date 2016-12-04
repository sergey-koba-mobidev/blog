module App
  module Controllers
    module Posts
      class Create < BaseAction
        def call(params)
          run Post::Create, params: params.env['rack.request.form_hash'] do |op|

          end
          render_layout 'test'
        end
      end
    end
  end
end