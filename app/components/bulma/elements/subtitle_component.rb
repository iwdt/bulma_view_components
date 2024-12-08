module Bulma
  module Elements
    # Simple headings to add depth to your page
    #
    # @see https://bulma.io/documentation/elements/title/ Bulma's documentation
    #
    # @example Basic example of usage
    #   <%= render Bulma::Elements::SubtitleComponent.new do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <h1 class="subtitle"><strong>Content</strong></h1>
    #
    # @example Usage with {#with_content}
    #   <%= render Bulma::Elements::SubtitleComponent.new.with_content("Content") %>
    #   #=> <h1 class="subtitle">Content</h1>
    #
    # @example Usage within ruby on rails helper
    #   <%= bulma.subtitle do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <h1 class="subtitle"><strong>Content</strong></h1>
    #
    # @example Usage with custom attributes
    #   <%= render Bulma::Elements::SubtitleComponent.new(tag: :div, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="subtitle" data-controller="sample"><strong>Content</strong></div>
    #
    # @example Usage within ruby on rails helper and custom attributes
    #   <%= bulma.subtitle(tag: :div, data: { controller: "sample" }) do %>
    #     <strong>Content</strong>
    #   <% end %>
    #   #=> <div class="subtitle" data-controller="sample"><strong>Content</strong></div>
    #
    # @since 0.1.0
    class SubtitleComponent < ApplicationComponent
      self.root_tag = :h1

      SIZE_MAP = {
        "1" => :one,
        "2" => :two,
        "3" => :three,
        "4" => :four,
        "5" => :five,
        "6" => :six
      }.freeze

      style do
        base { "subtitle" }

        variants do
          # steep:ignore:start
          size do
            one { "is-1" }
            two { "is-2" }
            three { "is-3" }
            four { "is-4" }
            five { "is-5" }
            six { "is-6" }
          end
          spaced do
            yes { "is-spaced" }
          end
          # steep:ignore:end
        end
      end

      def initialize(subtitle = nil, tag: nil, size: nil, spaced: false, **html_attributes)
        @subtitle = subtitle
        @size = SIZE_MAP.fetch(size.to_s) unless size.nil?
        @spaced = spaced

        tag = size.nil? ? self.class.root_tag : :"h#{size}" if tag.nil?
        super(tag: tag, **html_attributes)
      end

      def call
        content_tag(
          root_tag,
          safe_join([@subtitle, content]),
          **root_attributes(spaced: @spaced, size: @size)
        )
      end
    end
  end
end
