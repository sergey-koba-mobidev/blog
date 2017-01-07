class BaseCell < Trailblazer::Cell
  include ::Cell::Erb
  include Hanami::Helpers
  include WillPaginate::CellHelpers
  include R18n::Helpers

  def lang_base_url
    "#{R18n.get.locale.code != DEFAULT_LANG ? "/#{R18n.get.locale.code}" : ''}"
  end
end