class Post < Sequel::Model(DB)
  class Cell
    class Show < BaseCell
      property :id
      property :title
      property :active
      property :created_at
      property :updated_at
      property :activated_at

      def active_icon
        "<span class=\"fa #{model.active ? 'fa-check' : 'fa-times'}\"></span>"
      end
    end
  end
end