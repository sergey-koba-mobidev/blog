module Html
  module Cell
    class FlashMessage < BaseCell
      property :message
      property :type

      def alert_class
        case model.type
          when 'success'
            'success'
          when 'error'
            'danger'
          else
            'warning'
        end
      end
    end
  end
end