module Backup
  module Cell
    class Show < BaseCell
      include Formular::Helper
      def posts_count
        @options[:posts_count]
      end
    end
  end
end