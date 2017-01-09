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

      def preview_link
        ''
      end

      def clone_link
        ''
      end

      def langs_array
        [['English', 'en'], ['Russian', 'ru']]
      end
    end
  end
end