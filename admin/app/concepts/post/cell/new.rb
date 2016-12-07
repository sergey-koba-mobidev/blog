class Post < Sequel::Model(DB)
  class Cell
    class New < Trailblazer::Cell
      include ::Cell::Erb
      include Formular::Helper

    end
  end
end