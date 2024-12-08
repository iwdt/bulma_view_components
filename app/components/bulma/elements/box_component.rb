module Bulma
  module Elements
    # A white box to contain other elements
    #
    # @see https://bulma.io/documentation/elements/box/ Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::BoxComponent.new do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="box"><strong>Content</strong></div>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::BoxComponent.new.with_content("Content") %>
    #   #=> <div class="box">Content</div>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.box do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="box"><strong>Content</strong></div>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::BoxComponent.new(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="box" data-controller="sample"><strong>Content</strong></span>
    #
    # @example Usage within ruby on rails helper and custom attributes
    #   <%= bulma.box(tag: :span, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <span class="box" data-controller="sample"><strong>Content</strong></span>
    #
    # @since 0.1.0
    class BoxComponent < ApplicationComponent
      style do
        base { %w[box] }
      end
    end
  end
end
