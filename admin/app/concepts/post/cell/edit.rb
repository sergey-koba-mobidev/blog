require_relative 'new'

class Post < Sequel::Model(DB)
  class Cell
    class Edit < New
      def form_path
        Router.path(:update_post, id: model.id)
      end

      def form_action_title
        'Edit'
      end

      def preview_link
        link_to 'Preview', Constants::frontend_article_url + model.slug, class: 'btn btn-info btn-sm', target: '_blank'
      end

      def clone_link
        link_to 'Clone', Router.path(:clone_post, id: model.id), class: 'btn btn-warning btn-sm', stlye: 'margin-right: 5px;'
      end

      def show
        render :new
      end
    end
  end
end