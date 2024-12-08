module Bulma
  module Elements
    # A versatile delete cross
    #
    # @see https://bulma.io/documentation/elements/delete/ Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::DeleteComponent.new do %>
    #     <strong>X</strong>
    #   <% end %>
    #   #=> <button class="delete"><strong>X</strong></button>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::DeleteComponent.new.with_content("X") %>
    #   #=> <button class="delete">X</button>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.delete do %>
    #     <strong>X</strong>
    #   <% end %>
    #   #=> <button class="delete"><strong>X</strong></button>
    #
    # @example Usage within ruby on rails helper and without content
    #   <%= bulma.delete %>
    #   #=> <button class="delete"></button>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::DeleteComponent.new(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>X</strong>
    #   <% end %>
    #   #=> <span class="delete" data-controller="sample"><strong>X</strong></span>
    #
    # @example Usage within ruby on rails helper and custom attributes
    #   <%= bulma.delete(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>X</strong>
    #   <% end %>
    #   #=> <span class="delete" data-controller="sample"><strong>X</strong></span>
    #
    # @since 0.1.0
    class DeleteComponent < ApplicationComponent
      self.root_tag = :button

      style do
        base { "delete" }

        variants do
          # steep:ignore:start
          size do
            small { "is-small" }
            normal { "is-normal" }
            medium { "is-medium" }
            large { "is-large" }
          end
          # steep:ignore:end
        end
      end

      # @param size [Symbol] Delete button size. one of :small, :normal, :medium or :large
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(size: nil, **html_attributes)
        @size = size
        super(**html_attributes)
      end

      def call
        content_tag(
          root_tag,
          content,
          **root_attributes(size: @size)
        )
      end
    end
  end
end
