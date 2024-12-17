module Bulma
  module Components
    class ModalComponent < ApplicationComponent
      # @dynamic with_modal_overlay, modal_overlay
      renders_one :modal_overlay, ->(**html_attributes) do
        # steep:ignore:start
        ApplicationComponent.new(
          class: ["modal-background", html_attributes.delete(:class)],
          **html_attributes
        )
        # steep:ignore:end
      end

      # @dynamic with_modal_close, modal_close
      renders_one :modal_close, ->(tag: :button, **html_attributes) do
        # steep:ignore:start
        ApplicationComponent.new(
          tag: tag,
          class: ["modal-close", "is-large", html_attributes.delete(:class)],
          **html_attributes
        )
        # steep:ignore:end
      end

      # @dynamic with_modal_content, modal_content, modal_content?
      renders_one :modal_content, Modal::ContentComponent

      # @dynamic with_modal_card, modal_card, modal_card?
      renders_one :modal_card, Modal::CardComponent

      style do
        base { "modal" }

        variants do
          # steep:ignore:start
          active do
            yes { "is-active" }
          end
          # steep:ignore:end
        end
      end

      def initialize(active: false, **html_attributes)
        @active = active
        super(**html_attributes)
      end

      def call
        content_tag(root_tag, **root_attributes(active: @active)) do
          safe_join([
            modal_overlay,
            modal_content,
            modal_card,
            modal_close
          ])
        end
      end

      private :with_modal_content
      def body(**html_attributes, &block)
        with_modal_content(**html_attributes, &block)
      end

      private :with_modal_card
      def card(**html_attributes, &block)
        with_modal_card(**html_attributes, &block)
      end

      private :with_modal_overlay
      def overlay(**html_attributes, &block)
        with_modal_overlay(**html_attributes, &block)
      end

      private :with_modal_close
      def close(**html_attributes, &block)
        with_modal_close(**html_attributes, &block)
      end

      def before_render
        if !modal_card? && !modal_content? && content?
          with_modal_content { content }
        end
      end
    end
  end
end
