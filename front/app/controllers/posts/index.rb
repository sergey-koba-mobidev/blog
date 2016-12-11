module App
  module Controllers
    module Posts
      class Index < BaseAction
        def call(params)
          render_layout Post::Cell::List.new(nil, collection: Post::PagedList.(page: params[:page]).model)
        end
      end
    end
  end
end