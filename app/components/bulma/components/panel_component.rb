module Bulma
  module Components
    class PanelComponent < ApplicationComponent
      self.root_tag = :nav

      # @dynamic panel_header, with_panel_header
      renders_one :panel_header, Panel::HeaderComponent

      # @dynamic panel_items, with_panel_item_link_to, with_panel_item_label, with_panel_item_block, with_panel_item_tabs
      renders_many :panel_items, types: {
        link_to: Panel::LinkComponent,
        label: Panel::LabelComponent,
        block: Panel::BlockComponent,
        tabs: Panel::TabsComponent
      }

      style do
        base { "panel" }
        variants do
          # steep:ignore:start
          color do
            link { "is-link" }
            primary { "is-primary" }
            info { "is-info" }
            success { "is-success" }
            warning { "is-warning" }
            danger { "is-danger" }
          end
          # steep:ignore:end
        end
      end

      def initialize(color: nil, **html_attributes)
        @color = color

        super(**html_attributes)
      end

      def call
        content_tag(root_tag, safe_join([panel_header, *panel_items]), **root_attributes(color: @color))
      end

      private :with_panel_header
      def header(text = nil, **html_attributes, &block)
        with_panel_header(text, **html_attributes, &block)
      end

      private :with_panel_item_block
      def block(**html_attrbutes, &block)
        with_panel_item_block(**html_attrbutes, &block)
      end

      private :with_panel_item_link_to
      def link_to(name = nil, options = nil, **html_attributes, &block)
        with_panel_item_link_to(name, options, **html_attributes, &block)
      end

      private :with_panel_item_label
      def label(**html_attrbutes, &block)
        with_panel_item_label(**html_attrbutes, &block)
      end

      private :with_panel_item_tabs
      def tabs(**html_attrbutes, &block)
        with_panel_item_tabs(**html_attrbutes, &block)
      end
    end
  end
end
