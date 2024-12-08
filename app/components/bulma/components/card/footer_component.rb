module Bulma
  module Components
    module Card
      class FooterComponent < ApplicationComponent
        # @dynamic card_footer_items, with_card_footer_item_tag, with_card_footer_item_link_to, with_card_footer_item_button_to, with_card_footer_item_sms_to, with_card_footer_item_phone_to, with_card_footer_item_mail_to
        renders_many :card_footer_items, types: {
          tag: Footer::ItemComponent,
          link_to: Footer::LinkComponent,
          button_to: Footer::FormComponent,
          sms_to: Footer::SmsComponent,
          phone_to: Footer::PhoneComponent,
          mail_to: Footer::MailComponent
        }

        self.root_tag = :footer

        style do
          base { "card-footer" }
        end

        def call
          content_tag(root_tag, safe_join([*card_footer_items, content]), **root_attributes)
        end

        private :with_card_footer_item_tag
        def item(**html_attributes, &block)
          with_card_footer_item_tag(**html_attributes, &block)
        end

        private :with_card_footer_item_link_to
        def link_to(name = nil, options = nil, **html_options, &block)
          with_card_footer_item_link_to(name, options, **html_options, &block)
        end

        private :with_card_footer_item_button_to
        def button_to(name = nil, options = nil, **html_options, &block)
          with_card_footer_item_button_to(name, options, **html_options, &block)
        end

        private :with_card_footer_item_mail_to
        def mail_to(email_address, name = nil, **html_options, &block)
          with_card_footer_item_mail_to(email_address, name, **html_options, &block)
        end

        private :with_card_footer_item_phone_to
        def phone_to(phone_number, name = nil, **html_options, &block)
          with_card_footer_item_phone_to(phone_number, name, **html_options, &block)
        end

        private :with_card_footer_item_sms_to
        def sms_to(phone_number, name = nil, **html_options, &block)
          with_card_footer_item_sms_to(phone_number, name, **html_options, &block)
        end
      end
    end
  end
end
