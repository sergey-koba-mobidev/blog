class PostCell < Cell::ViewModel
  include ::Cell::Erb

  property :title
  property :content
end