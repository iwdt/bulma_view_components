module Bulma
  module Components
    module Dropdown
      class MenuComponent < ApplicationComponent
        # @dynamic dropdown_items, with_dropdown_item_tag, with_dropdown_item_divider, with_dropdown_item_link_to, with_dropdown_item_button_to, with_dropdown_item_sms_to, with_dropdown_item_phone_to, with_dropdown_item_mail_to
        renders_many :dropdown_items, types: {
          tag: Menu::ItemComponent,
          link_to: Menu::LinkComponent,
          button_to: Menu::FormComponent,
          sms_to: Menu::SmsComponent,
          phone_to: Menu::PhoneComponent,
          mail_to: Menu::MailComponent,
          divider: Menu::DividerComponent
        }

        style do
          base { "dropdown-menu" }
        end

        style :content do
          base { "dropdown-content" }
        end

        def call
          content_tag(root_tag, **root_attributes) do
            tag.div class: style(:content) do
              safe_join([*dropdown_items, content])
            end
          end
        end

        private :with_dropdown_item_tag
        def item(**html_attributes, &block)
          with_dropdown_item_tag(**html_attributes, &block)
        end

        private :with_dropdown_item_link_to
        def link_to(name = nil, options = nil, **html_options, &block)
          with_dropdown_item_link_to(name, options, **html_options, &block)
        end

        private :with_dropdown_item_button_to
        def button_to(name = nil, options = nil, **html_options, &block)
          with_dropdown_item_button_to(name, options, **html_options, &block)
        end

        private :with_dropdown_item_mail_to
        def mail_to(email_address, name = nil, **html_options, &block)
          with_dropdown_item_mail_to(email_address, name, **html_options, &block)
        end

        private :with_dropdown_item_phone_to
        def phone_to(phone_number, name = nil, **html_options, &block)
          with_dropdown_item_phone_to(phone_number, name, **html_options, &block)
        end

        private :with_dropdown_item_sms_to
        def sms_to(phone_number, name = nil, **html_options, &block)
          with_dropdown_item_sms_to(phone_number, name, **html_options, &block)
        end

        private :with_dropdown_item_divider
        def divider(**html_attributes)
          with_dropdown_item_divider(**html_attributes)
        end
      end
    end
  end
end
