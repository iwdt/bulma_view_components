module Bulma
  module Elements
    # List of buttons
    #
    # @see https://bulma.io/documentation/elements/button/#list-of-buttons Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::ButtonsComponent.new do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="buttons"><strong>Content</strong></div>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::ButtonsComponent.new.with_content("Content") %>
    #   #=> <div class="buttons">Content</div>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.buttons do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="buttons"><strong>Content</strong></div>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::ButtonsComponent.new(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="buttons" data-controller="sample"><strong>Content</strong></span>
    #
    # @example Usage within ruby on rails helper and custom attributes
    #   <%= bulma.buttons(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="buttons" data-controller="sample"><strong>Content</strong></span>
    #
    # @since 0.1.0
    class ButtonsComponent < ApplicationComponent
      # @dynamic buttons, with_button_link_to, with_button_tag, with_button_to, with_button_mail_to, with_button_phone_to, with_button_sms_to
      renders_many :buttons, types: {
        tag: ButtonComponent,
        link_to: Button::LinkComponent,
        sms_to: Button::SmsComponent,
        mail_to: Button::MailComponent,
        phone_to: Button::PhoneComponent,
        to: Button::FormComponent
      }.freeze

      style do
        base { "buttons" }

        variants do
          # steep:ignore:start
          alignment do
            center { "is-centered" }
            right { "is-right" }
          end

          addons do
            yes { "has-addons" }
          end
          # steep:ignore:end
        end
      end

      # @param alignment [Symbol] Buttons alignment. one of :center or :right
      # @param addons [Boolean] Has addons?
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(alignment: nil, addons: false, **html_attributes)
        @alignment = alignment
        @addons = addons

        super(**html_attributes)
      end

      def call
        content_tag(
          root_tag,
          safe_join([buttons, content]),
          **root_attributes(alignment: @alignment, addons: @addons)
        )
      end

      private :with_button_link_to
      def link_to(name = nil, options = nil, **html_options, &block)
        with_button_link_to(name, options, **html_options, &block)
      end

      private :with_button_tag
      def button_tag(content_or_options = nil, **html_options, &block)
        with_button_tag(content_or_options, **html_options, &block)
      end

      private :with_button_to
      def button_to(name = nil, options = nil, **html_options, &block)
        with_button_to(name, options, **html_options, &block)
      end

      private :with_button_mail_to
      def mail_to(email_address, name = nil, **html_options, &block)
        with_button_mail_to(email_address, name, **html_options, &block)
      end

      private :with_button_phone_to
      def phone_to(phone_number, name = nil, **html_options, &block)
        with_button_phone_to(phone_number, name, **html_options, &block)
      end

      private :with_button_sms_to
      def sms_to(phone_number, name = nil, **html_options, &block)
        with_button_sms_to(phone_number, name, **html_options, &block)
      end
    end
  end
end
