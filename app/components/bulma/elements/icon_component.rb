module Bulma
  module Elements
    # Compatible with all icon font libraries, including Font Awesome 5
    #
    # @see https://bulma.io/documentation/elements/icon/ Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::IconComponent.new do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="icon"><strong>Content</strong></div>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::IconComponent.new.with_content("Content") %>
    #   #=> <div class="icon">Content</div>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.icon do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="icon"><strong>Content</strong></div>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::IconComponent.new(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="icon" data-controller="sample"><strong>Content</strong></span>
    #
    # @example Usage within ruby on rails helper and custom attributes
    #   <%= bulma.icon(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="icon" data-controller="sample"><strong>Content</strong></span>
    #
    # @since 0.1.0
    class IconComponent < ApplicationComponent
      self.root_tag = :span

      style do
        base { "icon" }

        variants do
          # steep:ignore:start
          size do
            small { "is-small" }
            normal { "is-normal" }
            medium { "is-medium" }
            large { "is-large" }
          end
          left do
            yes { "is-left" }
          end
          # steep:ignore:end
        end
      end

      # @param size [Symbol] Icon size. one of :small, :normal, :medium or :large
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(size: nil, left: false, **html_attributes)
        @size = size
        @left = left
        super(**html_attributes)
      end

      def call
        content_tag root_tag, content, **root_attributes(size: @size)
      end
    end
  end
end
