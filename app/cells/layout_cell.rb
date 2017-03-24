class LayoutCell < Cell::ViewModel
  include ::Cell::Erb

  def show(&block)
    render(&block)
  end
end