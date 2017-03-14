module App
  module Controllers
    module Tags
      class Show < BaseAction
        def call(params)
          render_layout Tag::Cell::Show.new(params[:tag], collection: Tag::PagedList.(page: params[:page], lang: R18n.get.locale.code, tag: params[:tag])['result.posts']), tag: params[:tag]
        end
      end
    end
  end
end