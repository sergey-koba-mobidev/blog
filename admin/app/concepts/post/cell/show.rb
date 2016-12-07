class Post < Sequel::Model(DB)
  class Cell
    class Show < Trailblazer::Cell
      include ::Cell::Erb
      include ::Cell::Erb

      property :id
      property :title
      property :content
      property :created_at
      property :updated_at
    end
  end
end