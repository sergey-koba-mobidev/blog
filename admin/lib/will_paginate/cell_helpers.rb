require 'will_paginate/view_helpers'
require 'will_paginate/view_helpers/link_renderer'

module WillPaginate
  module CellHelpers
    include ViewHelpers

    def will_paginate(collection, options = {})
      options = options.merge(:renderer => LinkRenderer) unless options[:renderer]
      super(collection, options)
    end
  end

  class LinkRenderer < ViewHelpers::LinkRenderer
    protected

    def url(page)
      "#{@template.respond_to?(:pagination_base_url) ? @template.pagination_base_url : ''}/page/#{page}"
    end
  end
end