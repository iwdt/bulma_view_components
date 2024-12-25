module Bulma
  module Components
    module Navbar
      module Brand
        class BurgerComponent < ApplicationComponent
          self.root_tag = :a

          style do
            base { "navbar-burger" }

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
            content_tag(root_tag, slices, **root_attributes)
          end

          private

          def slices
            safe_join([slice, slice, slice, slice])
          end

          def slice
            tag.span(aria: {hidden: "true"})
          end
        end
      end
    end
  end
end
