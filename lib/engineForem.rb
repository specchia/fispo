require 'forem'
module Forem
  module Theme
    module Base
      class Engine < Rails::Engine
        Forem.theme = :orange
      end
    end
  end
end

