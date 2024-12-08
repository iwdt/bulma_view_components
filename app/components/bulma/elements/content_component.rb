module Bulma
  module Elements
    # A single class to handle WYSIWYG generated content, where only HTML tags are available
    #
    # @see https://bulma.io/documentation/elements/content/ Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::ContentComponent.new do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="content"><strong>Content</strong></div>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::ContentComponent.new.with_content("Content") %>
    #   #=> <div class="content">Content</div>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.content do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="content"><strong>Content</strong></div>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::ContentComponent.new(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="content" data-controller="sample"><strong>Content</strong></span>
    #
    # @example Usage within ruby on rails helper and custom attributes
    #   <%= bulma.content(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="content" data-controller="sample"><strong>Content</strong></span>
    #
    # @since 0.1.0
    class ContentComponent < ApplicationComponent
      style do
        base { "content" }

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

      # @param size [Symbol] Content size. one of :small, :normal, :medium or :large
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(size: nil, **html_attributes)
        @size = size
        super(**html_attributes)
      end

      def call
        content_tag(root_tag, content, **root_attributes(size: @size))
      end
    end
  end
end
