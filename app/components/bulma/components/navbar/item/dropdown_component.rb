module Bulma
  module Components
    module Navbar
      module Item
        class DropdownComponent < ItemComponent
          # @dynamic dropdown_menu, with_dropdown_menu
          renders_one :dropdown_menu, Dropdown::MenuComponent
          # @dynamic dropdown_trigger, with_dropdown_trigger
          renders_one :dropdown_trigger, Dropdown::TriggerComponent

          style :dropdown do
            base { "has-dropdown" }

            variants do
              # steep:ignore:start
              hoverable do
                yes { "is-hoverable" }
              end
              active do
                yes { "is-active" }
              end
              mobile do
                yes { "navbar-dropdown" }
              end
              right do
                yes { "is-right" }
              end
              up do
                yes { "has-dropdown-up" }
              end
              boxed do
                yes { "is-boxed" }
              end
              # steep:ignore:end
            end
          end

          def initialize(
            mobile: false,
            active: false,
            hoverable: false,
            up: false,
            right: false,
            boxed: false,
            **html_attributes
          )
            @hoverable = hoverable
            @active = active
            @mobile = mobile
            @up = up
            @right = right
            @boxed = boxed

            super(**html_attributes)
          end

          def call
            content_tag(
              root_tag,
              safe_join([dropdown_trigger, dropdown_menu]),
              **root_attributes(
                :base, :dropdown,
                hoverable: @hoverable,
                active: @active,
                mobile: @mobile,
                right: @right,
                up: @up,
                boxed: @boxed,
                **variants
              )
            )
          end

          private :with_dropdown_trigger
          def trigger(name = nil, options = nil, **html_attributes, &block)
            with_dropdown_trigger(name, options, **html_attributes, &block)
          end

          private :with_dropdown_menu
          def menu(**html_attributes, &block)
            with_dropdown_menu(**html_attributes, &block)
          end
        end
      end
    end
  end
end
