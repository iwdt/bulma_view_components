module Bulma
  module Components
    module Navbar
      module Item
        class DividerComponent < ApplicationComponent
          style do
            base { "navbar-divider" }
          end

          def call
            tag.hr(**root_attributes)
          end
        end
      end
    end
  end
end
