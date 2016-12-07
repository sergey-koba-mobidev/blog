module App
  module Controllers
    module Posts
      class Edit < BaseAction
        def call(params)
          render_layout Post::Cell::Edit.(Post[params[:id]])
        end
      end
    end
  end
end