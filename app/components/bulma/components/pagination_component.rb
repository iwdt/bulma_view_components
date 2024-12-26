module Bulma
  module Components
    class PaginationComponent < ApplicationComponent
      self.root_tag = :nav

      # @dynamic pager_prev, with_pager_prev
      renders_one :pager_prev, Pagination::PrevComponent
      # @dynamic pager_next, with_pager_next
      renders_one :pager_next, Pagination::NextComponent

      # @dynamic pager_items, with_pager_item_link, with_pager_item_ellipsis
      renders_many :pager_items, types: {
        link: Pagination::LinkComponent,
        ellipsis: Pagination::EllipsisComponent
      }

      style do
        base { "pagination" }
        variants do
          # steep:ignore:start
          rounded do
            yes { "is-rounded" }
          end
          order do
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
          # steep:ignore:end
        end
      end

      style :list do
        base { "pagination-list" }
      end

      def initialize(rounded: false, size: nil, order: nil, **html_attributes)
        @rounded = rounded
        @size = size
        @order = order

        super(**html_attributes)
      end

      def call
        content_tag(
          root_tag,
          safe_join([pager_prev, pager_next, pager_list]),
          **root_attributes(size: @size, order: @order, rounded: @rounded)
        )
      end

      private :with_pager_prev
      def prev(name = nil, option = nil, **html_attributes, &block)
        with_pager_prev(name, option, **html_attributes, &block)
      end

      private :with_pager_next
      def next(name = nil, option = nil, **html_attributes, &block)
        with_pager_next(name, option, **html_attributes, &block)
      end

      private :with_pager_item_link
      def page(name = nil, option = nil, **html_attributes, &block)
        with_pager_item_link(name, option, **html_attributes, &block)
      end

      private :with_pager_item_ellipsis
      def ellipsis(text = Pagination::EllipsisComponent::ELLIPSIS_ENTITY_NAME, **html_attributes, &block)
        with_pager_item_ellipsis(text, **html_attributes, &block)
      end

      private

      def pager_list
        content_tag :ul, safe_join(pager_items), class: style(:list)
      end
    end
  end
end
