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
      return @template.respond_to?(:pagination_base_url) ? @template.pagination_base_url : '/' if page == 1
      "#{@template.respond_to?(:pagination_base_url) ? @template.pagination_base_url : ''}/page/#{page}"
    end

    # For Boostrap
    def html_container(html)
      tag :div, tag(:ul, html, :class => "pagination"), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
    end

    def gap
      tag :li, link('&hellip;'.html_safe, '#'), :class => 'disabled'
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'),
          :class => [(classname[0..3] if  @options[:page_links]), (classname if @options[:page_links]), ('disabled' unless page)].join(' ')
    end
  end
end