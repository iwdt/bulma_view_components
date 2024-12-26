module Bulma
  module Components
    class TabsComponent < ApplicationComponent
      # @dynamic tab_links, with_tab_link
      renders_many :tab_links, Tabs::TabComponent

      style do
        base { "tabs" }
        variants do
          # steep:ignore:start
          alignment do
            left { "is-left" }
            center { "is-centered" }
            right { "is-right" }
          end
          size do
            small { "is-small" }
            normal { "is-normal" }
            medium { "is-medium" }
            large { "is-large" }
          end
          style do
            boxed { "is-boxed" }
            toggle { "is-toggle" }
            rounded { "is-toggle-rounded" }
          end
          full_width do
            yes { "is-fullwidth" }
          end
          # steep:ignore:end
        end
      end

      def initialize(alignment: nil, size: nil, variant: nil, full_width: false, **html_attributes)
        @alignment = alignment
        @size = size
        @variant = variant
        @full_width = full_width
        super(**html_attributes)
      end

      def call
        content_tag(
          root_tag,
          safe_join(tab_links),
          **root_attributes(
            alignment: @alignment,
            size: @size,
            variant: @variant,
            full_width: @full_width
          )
        )
      end

      private :with_tab_link
      def link_to(name = nil, options = nil, **html_attributes, &block)
        with_tab_link(name, options, **html_attributes, &block)
      end
    end
  end
end
