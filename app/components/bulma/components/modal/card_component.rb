module Bulma
  module Components
    module Modal
      class CardComponent < ApplicationComponent
        # @dynamic card_header, with_card_header
        renders_one :card_header, Card::HeaderComponent
        # @dynamic card_content, card_content?, with_card_content
        renders_one :card_content, Card::ContentComponent
        # @dynamic card_footer, with_card_footer
        renders_one :card_footer, Card::FooterComponent

        style do
          base { "modal-card" }
        end

        def call
          content_tag(root_tag, **root_attributes) do
            safe_join([
              card_header,
              card_content,
              card_footer
            ])
          end
        end

        private :with_card_header
        def header(**html_attributes, &block)
          with_card_header(**html_attributes, &block)
        end

        private :with_card_content
        def body(**html_attributes, &block)
          with_card_content(**html_attributes, &block)
        end

        private :with_card_footer
        def footer(**html_attributes, &block)
          with_card_footer(**html_attributes, &block)
        end

        private

        def before_render
          if !card_content? && content?
            with_card_content { content }
          end
        end
      end
    end
  end
end
