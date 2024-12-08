module Bulma
  module Components
    class DropdownComponent < ApplicationComponent
      # @dynamic dropdown_menu, with_dropdown_menu
      renders_one :dropdown_menu, Dropdown::MenuComponent
      # @dynamic dropdown_trigger, with_dropdown_trigger
      renders_one :dropdown_trigger, Dropdown::TriggerComponent

      style do
        base { "dropdown" }
        variants do
          # steep:ignore:start
          active do
            yes { "is-active" }
          end
          hoverable do
            yes { "is-hoverable" }
          end
          right do
            yes { "is-right" }
          end
          up do
            yes { "is-up" }
          end
          # steep:ignore:end
        end
      end

      def initialize(active: false, hoverable: false, right: false, up: false, **html_attributes)
        @active = active
        @hoverable = hoverable
        @right = right
        @up = up

        super(**html_attributes)
      end

      def call
        content_tag(
          root_tag,
          safe_join([dropdown_trigger, dropdown_menu]),
          **root_attributes(
            active: @active,
            hoverable: @hoverable,
            right: @right,
            up: @up
          )
        )
      end

      private :with_dropdown_trigger
      def trigger(**html_attributes, &block)
        with_dropdown_trigger(**html_attributes, &block)
      end

      private :with_dropdown_menu
      def menu(**html_attributes, &block)
        with_dropdown_menu(**html_attributes, &block)
      end
    end
  end
end
