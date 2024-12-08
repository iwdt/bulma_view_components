module Bulma
  module Components
    # A simple breadcrumb component to improve your navigation experience
    #
    # @see https://bulma.io/documentation/components/breadcrumb/ Bulma's documentation
    #
    # @since 0.1.0
    class BreadcrumbComponent < ApplicationComponent
      self.root_tag = :nav

      style do
        base { "breadcrumb" }
        variants do
          # steep:ignore:start
          alignment do
            centered { "is-centered" }
            right { "is-right" }
          end
          separator do
            arrow { "has-arrow-separator" }
            bullet { "has-bullet-separator" }
            dot { "has-dot-separator" }
            succeeds { "has-succeeds-separator" }
          end
          size do
            small { "is-small" }
            normal { "is-normal" }
            medium { "is-medium" }
            large { "is-large" }
          end
          # steep:ignore:end
        end
      end

      style(:item) do
        variants do
          # steep:ignore:start
          active do
            yes { "is-active" }
          end
          # steep:ignore:end
        end
      end

      # @dynamic breadcrumb_items, breadcrumb_items?, with_breadcrumb_items, with_breadcrumb_item
      renders_many :breadcrumb_items, ApplicationComponent

      def initialize(separator: nil, alignment: nil, size: nil, **html_attributes)
        @separator = separator
        @alignment = alignment
        @size = size

        super(**html_attributes)
      end

      def call
        items = content_tag(:ul, safe_join(breadcrumb_items)) if breadcrumb_items?

        content_tag(
          root_tag,
          safe_join([items, content]),
          **root_attributes(alignment: @alignment, separator: @separator, size: @size)
        )
      end

      private :with_breadcrumb_item
      private :with_breadcrumb_items
      def item(tag: :li, active: false, **html_attributes, &block)
        classes = [style(:item, active: active), html_attributes.delete(:class)]

        with_breadcrumb_item(
          tag: tag, class: classes, **html_attributes, &block
        )
      end
    end
  end
end
