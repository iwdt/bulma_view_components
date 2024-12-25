module Bulma
  module Components
    module Navbar
      module Item
        module Dropdown
          class MenuComponent < ApplicationComponent
            # @dynamic dropdown_items, with_dropdown_item_base, with_dropdown_item_divider, with_dropdown_item_link, with_dropdown_item_button_to, with_dropdown_item_sms_to, with_dropdown_item_phone_to, with_dropdown_item_mail_to
            renders_many :dropdown_items, types: {
              base: ItemComponent,
              link: Item::LinkComponent,
              button_to: Item::FormComponent,
              sms_to: Item::SmsComponent,
              phone_to: Item::PhoneComponent,
              mail_to: Item::MailComponent,
              divider: Item::DividerComponent
            }

            style do
              base { "navbar-dropdown" }
            end

            def call
              content_tag(root_tag, **root_attributes) do
                safe_join([*dropdown_items, content])
              end
            end

            private :with_dropdown_item_base
            def item(**html_attributes, &block)
              with_dropdown_item_base(**html_attributes, &block)
            end

            private :with_dropdown_item_link
            def link_to(name = nil, options = nil, **html_options, &block)
              with_dropdown_item_link(name, options, **html_options, &block)
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
  end
end
