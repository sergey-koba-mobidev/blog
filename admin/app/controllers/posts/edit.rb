module App
  module Controllers
    module Posts
      class Edit < Posts::Base
        def call(params)
          render_layout Post::Cell::Edit.(Post[params[:id]])
        end
      end
    end
  end
end