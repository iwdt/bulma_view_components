module Bulma
  module Elements
    module Button
      # The classic button, in different colors, sizes, and states
      #
      # @api private
      # @abstract Inherit and implement button logic
      #
      # @see https://bulma.io/documentation/elements/button/ Bulma's documentation
      class BaseComponent < Bulma::ApplicationComponent
        style :base do
          base { "button" }

          variants do
            # steep:ignore:start
            full_width { yes { "is-fullwidth" } }
            responsive { yes { "is-responsive" } }
            outlined { yes { "is-outlined" } }
            rounded { yes { "is-rounded" } }
            static { yes { "is-static" } }
            inverted { yes { "is-inverted" } }
            theme do
              light { "is-light" }
              dark { "is-dark" }
            end
            color do
              white { "is-white" }
              black { "is-black" }
              text { "is-text" }
              ghost { "is-ghost" }
              primary { "is-primary" }
              link { "is-link" }
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
            state do
              hovered { "is-hovered" }
              focused { "is-focused" }
              active { "is-active" }
            end
            selected do
              yes { "is-selected" }
            end
            loading do
              yes { "is-loading" }
            end
            # steep:ignore:end
          end
        end

        # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
        # @option html_attributes [Symbol] :color (nil) button color. one of white, :black, :text, :ghost, :primary, :link, :info, :success, :warning or :danger
        # @option html_attributes [Symbol] :theme (nil) button theme. one of :light or :dark
        # @option html_attributes [Symbol] :size (nil) button size. one of :small, :normal, :medium or :large
        # @option html_attributes [Symbol] :state (nil) button state. one of :hovered, :focused or :active
        # @option html_attributes [Boolean] :responsive (nil) button size is responsive?
        # @option html_attributes [Boolean] :full_width (nil) button width is full?
        # @option html_attributes [Boolean] :outlined (nil) button must be outlined?
        # @option html_attributes [Boolean] :rounded (nil) button must be a rounded?
        # @option html_attributes [Boolean] :static (nil) button must be a non-interactive?
        # @option html_attributes [Boolean] :inverted (nil) button's color must be inverted?
        # @option html_attributes [Boolean] :selected (nil) button must be above its siblings?
        # @option html_attributes [Boolean] :loading (nil) should the button be in loading state?
        def initialize(**html_attributes)
          @variants = html_attributes.extract!(
            :full_width, :responsive, :outlined, :rounded, :static,
            :inverted, :state, :size, :theme, :color, :loading, :selected
          )
          super
        end

        private

        # @dynamic variants
        attr_reader :variants
      end
    end
  end
end
