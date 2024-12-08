module Bulma
  module Components
    module Dropdown
      module Menu
        class ItemComponent < ApplicationComponent
          style :item do
            base { "dropdown-item" }

            variants do
              # steep:ignore:start
              active do
                yes { "is-active" }
              end
              # steep:ignore:end
            end
          end

          def initialize(active: false, **html_attributes)
            @active = active
            super(**html_attributes)
          end

          def call
            content_tag(root_tag, content, **root_attributes(:item, active: @active))
          end
        end
      end
    end
  end
end
