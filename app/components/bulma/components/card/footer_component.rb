module Bulma
  module Components
    module Card
      class FooterComponent < ApplicationComponent
        # @dynamic card_footer_items, with_card_footer_item
        renders_many :card_footer_items, Footer::ItemComponent

        self.root_tag = :footer

        style do
          base { "card-footer" }
        end

        def call
          content_tag(root_tag, safe_join([*card_footer_items, content]), **root_attributes)
        end

        private :with_card_footer_item
        def item(**html_attributes, &block)
          with_card_footer_item(**html_attributes, &block)
        end
      end
    end
  end
end
