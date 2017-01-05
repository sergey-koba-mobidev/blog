module App
  module Controllers
    module Tags
      class Show < BaseAction
        def call(params)
          render_layout Tag::Cell::Show.new(params[:tag], collection: Tag::PagedList.(page: params[:page], tag: params[:tag], lang: R18n.get.locale.code)['result.posts'])
        end
      end
    end
  end
end