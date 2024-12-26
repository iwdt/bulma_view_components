module Bulma
  module Components
    module Panel
      class IconComponent < ApplicationComponent
        self.root_tag = :span

        style do
          base { "panel-icon" }
        end
      end
    end
  end
end
