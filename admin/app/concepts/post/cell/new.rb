class Post < Sequel::Model(DB)
  class Cell
    class New < BaseCell
      include Formular::Helper

      def form_path
        Router.path(:create_post)
      end
    end
  end
end