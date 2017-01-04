module Backup
  module Cell
    class Show < BaseCell
      def posts_count
        @options[:posts_count]
      end
    end
  end
end