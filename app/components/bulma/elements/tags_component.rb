module Bulma
  module Elements
    # List of tags
    #
    # @see https://bulma.io/documentation/elements/tag/#list-of-tags Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::TagsComponent.new do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="tags"><strong>Content</strong></div>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::TagsComponent.new.with_content("Content") %>
    #   #=> <div class="tags">Content</div>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.tags do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="tags"><strong>Content</strong></div>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::TagsComponent.new(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="tags" data-controller="sample"><strong>Content</strong></span>
    #
    # @example Usage within ruby on rails helper and custom attributes
    #   <%= bulma.tags(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="tags" data-controller="sample"><strong>Content</strong></span>
    #
    # @since 0.1.0
    class TagsComponent < ApplicationComponent
      # @dynamic component_tags, with_component_tags, with_component_tag_basic, with_component_tag_link_to, with_component_tag_button_to, with_component_tag_sms_to, with_component_tag_mail_to, with_component_tag_phone_to
      renders_many :component_tags, types: {
        basic: TagComponent,
        link_to: Tag::LinkComponent,
        button_to: Tag::FormComponent,
        sms_to: Tag::SmsComponent,
        mail_to: Tag::MailComponent,
        phone_to: Tag::PhoneComponent
      }.freeze

      style do
        base { "tags" }

        variants do
          # steep:ignore:start
          addons do
            yes { "has-addons" }
          end
          # steep:ignore:end
        end
      end

      # @param addons [Boolean] Has addons?
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(addons: false, **html_attributes)
        @addons = addons
        super(**html_attributes)
      end

      def call
        content_tag(
          root_tag,
          safe_join([component_tags, content]),
          **root_attributes(addons: @addons)
        )
      end

      private :with_component_tag_basic
      def tag(name = nil, **html_options)
        with_component_tag_basic(name, **html_options)
      end

      private :with_component_tag_link_to
      def link_to(name = nil, options = nil, **html_options, &block)
        with_component_tag_link_to(name, options, **html_options, &block)
      end

      private :with_component_tag_button_to
      def button_to(name = nil, options = nil, **html_options, &block)
        with_component_tag_button_to(name, options, **html_options, &block)
      end

      private :with_component_tag_mail_to
      def mail_to(email_address, name = nil, **html_options, &block)
        with_component_tag_mail_to(email_address, name, **html_options, &block)
      end

      private :with_component_tag_phone_to
      def phone_to(phone_number, name = nil, **html_options, &block)
        with_component_tag_phone_to(phone_number, name, **html_options, &block)
      end

      private :with_component_tag_sms_to
      def sms_to(phone_number, name = nil, **html_options, &block)
        with_component_tag_sms_to(phone_number, name, **html_options, &block)
      end
    end
  end
end
