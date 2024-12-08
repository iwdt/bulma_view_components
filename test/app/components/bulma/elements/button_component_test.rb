require "test_helper"

module Bulma
  module Elements
    class ButtonComponentTest < ViewComponents::TestCase
      def test_render_component
        component = ButtonComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector(
          "button[type=submit]",
          text: "Test text",
          count: 1,
          visible: true,
          class: "button"
        )
      end

      def test_type_attribute
        component = ButtonComponent.new(type: :button)
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector(
          "button[type=button]",
          text: "Test text",
          count: 1,
          visible: true,
          class: "button"
        )
      end

      def test_with_inline_content
        component = ButtonComponent.new("Test text")
        render_inline(component)
        assert_component_rendered
        assert_selector(
          "button[type=submit]",
          text: "Test text",
          count: 1,
          visible: true,
          class: "button"
        )
      end

      def test_boolish_variants
        {
          full_width: "is-fullwidth",
          responsive: "is-responsive",
          outlined: "is-outlined",
          rounded: "is-rounded",
          static: "is-static",
          inverted: "is-inverted",
          selected: "is-selected",
          loading: "is-loading"
        }.each do |variant, class_name|
          component = ButtonComponent.new("Test text", variant => true)
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "button[type=submit]",
            text: "Test text",
            count: 1,
            visible: true,
            class: ["button", class_name]
          )
        end
      end

      def test_color_variant
        %i[white black text ghost primary link info success warning danger].each do |color|
          component = ButtonComponent.new("Test text", color: color)
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "button[type=submit]",
            text: "Test text",
            count: 1,
            visible: true,
            class: ["button", "is-#{color}"]
          )
        end
      end

      def test_size_variant
        %i[small normal medium large].each do |size|
          component = ButtonComponent.new("Test text", size: size)
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "button[type=submit]",
            text: "Test text",
            count: 1,
            visible: true,
            class: ["button", "is-#{size}"]
          )
        end
      end
    end
  end
end
