module Bulma
  module Components
    module Dropdown
      module Menu
        class DividerComponent < ApplicationComponent
          style do
            base { "dropdown-divider" }
          end

          def call
            tag.hr(**root_attributes)
          end
        end
      end
    end
  end
end
