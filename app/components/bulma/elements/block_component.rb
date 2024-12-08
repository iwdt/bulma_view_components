module Bulma
  module Elements
    # Bulma’s most basic spacer block
    #
    # @see https://bulma.io/documentation/elements/block/ Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::BlockComponent.new do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="block"><strong>Content</strong></div>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::BlockComponent.new.with_content("Content") %>
    #   #=> <div class="block">Content</div>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.block do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="block"><strong>Content</strong></div>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::BlockComponent.new(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="block" data-controller="sample"><strong>Content</strong></span>
    #
    # @example Usage within ruby on rails helper and custom attributes
    #   <%= bulma.block(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="block" data-controller="sample"><strong>Content</strong></span>
    #
    # @since 0.1.0
    class BlockComponent < ApplicationComponent
      style do
        base { %w[block] }
      end
    end
  end
end
