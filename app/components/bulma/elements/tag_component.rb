module Bulma
  module Elements
    # Small tag labels to insert anywhere
    #
    # @see https://bulma.io/documentation/elements/tag/ Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::TagComponent.new do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="tag"><strong>Content</strong></span>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::TagComponent.new.with_content("Content") %>
    #   #=> <span class="tag">Content</span>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.tag do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="tag"><strong>Content</strong></span>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::TagComponent.new(tag: :div, data: { controller: "sample" }) do %>
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
    class TagComponent < Tag::BaseComponent
      self.root_tag = :span

      # @param name [String] tag text.
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(name = nil, **html_attributes)
        @name = name
        super(**html_attributes)
      end

      def call
        content_tag(root_tag, safe_join([@name, content]), **root_attributes(:base, **variants))
      end
    end
  end
end
