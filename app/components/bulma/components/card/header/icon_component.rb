module Bulma
  module Components
    module Card
      module Header
        class IconComponent < ApplicationComponent
          self.root_tag = :button

          style do
            base { "card-header-icon" }
          end
        end
      end
    end
  end
end
