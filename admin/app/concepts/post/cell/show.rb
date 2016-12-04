class Post < Sequel::Model(DB)
  class Cell
    class Show < Trailblazer::Cell
      include ::Cell::Erb

      property :id
      property :title
      property :content
    end
  end
end