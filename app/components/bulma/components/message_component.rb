module Bulma
  module Components
    class MessageComponent < ApplicationComponent
      self.root_tag = :article

      # @dynamic message_header, with_message_header
      renders_one :message_header, Message::HeaderComponent

      style do
        base { "message" }
        variants do
          # steep:ignore:start
          color do
            dark { "is-dark" }
            link { "is-link" }
            primary { "is-primary" }
            info { "is-info" }
            success { "is-success" }
            warning { "is-warning" }
            danger { "is-danger" }
          end

          size do
            small { "is-small" }
            normal { "is-normal" }
            medium { "is-medium" }
            large { "is-large" }
          end
          # steep:ignore:end
        end
      end

      style :body do
        base { "message-body" }
      end

      def initialize(color: nil, size: nil, **html_attributes)
        @color = color
        @size = size

        super(**html_attributes)
      end

      def call
        content_tag(
          root_tag,
          safe_join(
            [message_header, message_body]
          ),
          **root_attributes(color: @color, size: @size)
        )
      end

      private :with_message_header
      def header(**html_attributes, &block)
        with_message_header(**html_attributes, &block)
      end

      private

      def message_body
        tag.div class: style(:body) do
          content
        end
      end
    end
  end
end
