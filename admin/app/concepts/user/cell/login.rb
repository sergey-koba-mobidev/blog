class User < Sequel::Model(DB)
  class Cell
    class Login < BaseCell
      include Formular::Helper
    end
  end
end