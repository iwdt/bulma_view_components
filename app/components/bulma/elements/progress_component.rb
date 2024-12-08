module Bulma
  module Elements
    # Native HTML progress bars
    #
    # @see https://bulma.io/documentation/elements/progress/ Bulma's documentation
    class ProgressComponent < ApplicationComponent
      self.root_tag = :progress

      style do
        base { "progress" }

        variants do
          # steep:ignore:start
          color do
            link { "is-link" }
            primary { "is-primary" }
            info { "is-info" }
            success { "is-success" }
            warning { "is-warning" }
            danger { "is-danger" }
            light { "is-light" }
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

      # @param value [Integer] progress bar current value
      # @param color [Symbol] progress bar color. one of :link, :primary, :info, :success, :warning or :danger
      # @param size [Symbol] progress bar size. one of :small, :normal, :medium or :large
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(value = nil, size: nil, color: nil, **html_attributes)
        html_attributes[:value] ||= value

        @size = size
        @color = color

        super(**html_attributes)
      end

      def call
        text = if content?
          content
        elsif root_attributes[:value].present?
          "#{root_attributes[:value]}%"
        end

        content_tag root_tag, text, **root_attributes(color: @color, size: @size)
      end
    end
  end
end
