module Bulma
  module Elements
    module Tag
      # Small tag labels to insert anywhere
      #
      # @see https://bulma.io/documentation/elements/tag/ Bulma's documentation
      #
      # @example Basic example of usage
      #   <%= render Bulma::Elements::Tag::Component.new do %>
      #     <strong>Content</strong>
      #   <% end %>
      #   #=> <span class="tag"><strong>Content</strong></span>
      #
      # @example Usage with {#with_content}
      #   <%= render Bulma::Elements::Tag::Component.new.with_content("Content") %>
      #   #=> <span class="tag">Content</span>
      #
      # @example Usage within ruby on rails helper
      #   <%= bulma.tag do %>
      #     <strong>Content</strong>
      #   <% end %>
      #   #=> <span class="tag"><strong>Content</strong></span>
      #
      # @example Usage with custom attributes
      #   <%= render Bulma::Elements::Tag::Component.new(tag: :div, data: { controller: "sample" }) do %>
      #     <strong>Content</strong>
      #   <% end %>
      #   #=> <div class="tag" data-controller="sample"><strong>Content</strong></div>
      #
      # @example Usage within ruby on rails helper and custom attributes
      #   <%= bulma.tag(tag: :div, data: { controller: "sample" }) do %>
      #     <strong>Content</strong>
      #   <% end %>
      #   #=> <div class="tag" data-controller="sample"><strong>Content</strong></div>
      #
      # @since 0.1.0
      class BaseComponent < ApplicationComponent
        style do
          base { "tag" }

          variants do
            # steep:ignore:start
            size do
              small { "is-small" }
              normal { "is-normal" }
              medium { "is-medium" }
              large { "is-large" }
            end
            color do
              black { "is-black" }
              dark { "is-dark" }
              white { "is-white" }
              primary { "is-primary" }
              link { "is-link" }
              info { "is-info" }
              success { "is-success" }
              warning { "is-warning" }
              danger { "is-danger" }
            end
            light do
              yes { "is-light" }
            end
            rounded do
              yes { "is-rounded" }
            end
            hoverable do
              yes { "is-hoverable" }
            end
            delete do
              yes { "is-delete" }
            end
            # steep:ignore:end
          end
        end

        # @param name [String] tag text.
        # @param size [Symbol] tag size. one of :small, :normal, :medium or :large
        # @param color [Symbol] tag color. one of :black, :dark, :light, :white, :primary, :link, :info, :success, :warning or :danger
        # @param light [Boolean] tag must be light version color?
        # @param hoverable [Boolean] tag must be hoverable?
        # @param rounded [Boolean] tag must be rounded?
        # @param delete [Boolean] tag must be a delete version?
        # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
        def initialize(
          size: nil,
          color: nil,
          light: false,
          hoverable: false,
          rounded: false,
          delete: false,
          **html_attributes
        )
          @size = size
          @color = color
          @light = light
          @hoverable = hoverable
          @rounded = rounded
          @delete = delete

          super(**html_attributes)
        end

        private

        def variants
          {
            size: @size,
            color: @color,
            light: @light,
            hoverable: @hoverable,
            rounded: @rounded,
            delete: @delete
          }
        end
      end
    end
  end
end
