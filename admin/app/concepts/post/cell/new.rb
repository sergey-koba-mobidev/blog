class Post < Sequel::Model(DB)
  class Cell
    class New < BaseCell
      include Formular::Helper
    end
  end
end