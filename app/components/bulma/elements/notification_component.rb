module Bulma
  module Elements
    # Bold notification blocks, to alert your users of something
    #
    # @see https://bulma.io/documentation/elements/notification/ Bulma's documentation
    class NotificationComponent < ApplicationComponent
      # @dynamic notification_close, with_notification_close
      renders_one :notification_close, DeleteComponent

      style do
        base { "notification" }

        variants do
          # steep:ignore:start
          color do
            link { "is-link" }
            primary { "is-primary" }
            info { "is-info" }
            success { "is-success" }
            warning { "is-warning" }
            danger { "is-danger" }
          end
          light do
            yes { "is-light" }
          end
          # steep:ignore:end
        end
      end

      # @param text [String] Notification content
      # @param color [Symbol] notification color. one of :link, :primary, :info, :success, :warning or :danger
      # @param light [Boolean] Use light colors
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(text = nil, color: nil, light: false, **html_attributes)
        @text = text
        @color = color
        @light = light

        super(**html_attributes)
      end

      def call
        content_tag(root_tag, safe_join([notification_close, @text, content]), **root_attributes(color: @color, light: @light))
      end

      private :with_notification_close
      def close(**html_attributes, &block)
        with_notification_close(**html_attributes, &block)
      end
    end
  end
end
