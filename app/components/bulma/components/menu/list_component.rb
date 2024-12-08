module Bulma
  module Components
    module Menu
      class ListComponent < ApplicationComponent
        # @dynamic list_items, with_list_item
        renders_many :list_items, List::ItemComponent

        self.root_tag = :ul

        style do
          base { "menu-list" }
        end

        def call
          content_tag(root_tag, safe_join([content, *list_items]), **root_attributes)
        end

        private :with_list_item
        def item(**html_attributes, &block)
          with_list_item(**html_attributes, &block)
        end
      end
    end
  end
end
