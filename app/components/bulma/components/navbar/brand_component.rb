module Bulma
  module Components
    module Navbar
      class BrandComponent < ApplicationComponent
        # @dynamic navbar_items, with_navbar_item_link, with_navbar_item_base, with_navbar_item_dropdown, with_navbar_item_button_to, with_navbar_item_sms_to, with_navbar_item_phone_to, with_navbar_item_mail_to,
        renders_many :navbar_items, types: {
          base: ItemComponent,
          link: Item::LinkComponent,
          button_to: Item::FormComponent,
          sms_to: Item::SmsComponent,
          phone_to: Item::PhoneComponent,
          mail_to: Item::MailComponent,
          dropdown: Item::DropdownComponent
        }

        # @dynamic with_navbar_burger, navbar_burger, navbar_burger?
        renders_one :navbar_burger, Brand::BurgerComponent

        style do
          base { "navbar-brand" }
        end

        def call
          content_tag(root_tag, safe_join([*navbar_items, navbar_burger]), **root_attributes)
        end

        private :with_navbar_burger
        def burger(**html_attributes, &block)
          with_navbar_burger(**html_attributes, &block)
        end

        private :with_navbar_item_base
        def item(**html_attributes, &block)
          with_navbar_item_base(**html_attributes, &block)
        end

        private :with_navbar_item_link
        def link_to(name = nil, options = nil, **html_attributes, &block)
          with_navbar_item_link(name, options, **html_attributes, &block)
        end
        # @dynamic logo
        alias_method :logo, :link_to

        private :with_navbar_item_dropdown
        def dropdown(**html_attributes, &block)
          with_navbar_item_dropdown(**html_attributes, &block)
        end

        private :with_navbar_item_button_to
        def button_to(name = nil, options = nil, **html_options, &block)
          with_navbar_item_button_to(name, options, **html_options, &block)
        end

        private :with_navbar_item_sms_to
        def sms_to(phone_number, name = nil, **html_options, &block)
          with_navbar_item_sms_to(phone_number, name, **html_options, &block)
        end

        private :with_navbar_item_phone_to
        def phone_to(phone_number, name = nil, **html_options, &block)
          with_navbar_item_phone_to(phone_number, name, **html_options, &block)
        end

        private :with_navbar_item_mail_to
        def mail_to(email_address, name = nil, **html_options, &block)
          with_navbar_item_mail_to(email_address, name, **html_options, &block)
        end
      end
    end
  end
end
