require_relative '../base_action'

module App
  module Controllers
    module Backup
      class Restore < BaseAction
        before :authenticate

        def call(params)
          result = ::Backup::RestorePosts.(params.env['rack.request.form_hash'])
          if result.success?
            add_flash_message "Restored #{result['posts_count']} posts", 'success'
          else
            add_flash_message 'Failed to restore backup', 'error'
          end
          render_layout ::Backup::Cell::Show.(nil, posts_count: Post.count)
        end
      end
    end
  end
end