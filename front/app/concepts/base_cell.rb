class BaseCell < Trailblazer::Cell
  include ::Cell::Erb
  include Hanami::Helpers
  include WillPaginate::CellHelpers
  include R18n::Helpers
end