module Html
  module Cell
    class Menu < BaseCell
      include ::Cell::Builder

      builds do |model, options|
        if options[:current_user]
          SignedInMenu
        else
          Menu
        end
      end
    end
  end
end