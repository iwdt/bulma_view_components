module Bulma
  module Components
    module Card
      class HeaderComponent < ApplicationComponent
        # @dynamic card_header_title, with_card_header_title
        renders_one :card_header_title, Header::TitleComponent
        # @dynamic card_header_icon, with_card_header_icon
        renders_one :card_header_icon, Header::IconComponent

        self.root_tag = :header

        style do
          base { "card-header" }
        end

        def call
          content_tag(root_tag, **root_attributes) do
            safe_join([
              card_header_title,
              card_header_icon,
              content
            ])
          end
        end

        private :with_card_header_title
        def title(text = nil, **html_attributes, &block)
          with_card_header_title(text, **html_attributes, &block)
        end

        private :with_card_header_icon
        def icon(**html_attributes, &block)
          with_card_header_icon(**html_attributes, &block)
        end
      end
    end
  end
end
