class Post < Sequel::Model(DB)
  class Cell
    class Show < BaseCell
      property :id
      property :title
      property :content
      property :created_at
      property :updated_at
    end
  end
end