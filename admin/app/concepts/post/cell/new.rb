class Post < Sequel::Model(DB)
  class Cell
    class New < BaseCell
      include Formular::Helper

      def form_action_title
        'New'
      end

      def form_path
        Router.path(:create_post)
      end
    end
  end
end