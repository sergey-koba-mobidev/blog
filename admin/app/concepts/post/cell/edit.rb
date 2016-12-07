class Post < Sequel::Model(DB)
  class Cell
    class Edit < BaseCell
      include Formular::Helper

      def form_path
        Router.path(:update_post, id: model.id)
      end

      def show
        render :new
      end
    end
  end
end