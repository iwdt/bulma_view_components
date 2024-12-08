require "test_helper"

module Bulma
  module Elements
    class TagComponentTest < ViewComponents::TestCase
      def test_render_component
        component = TagComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector(
          "span",
          text: "Test text",
          count: 1,
          visible: true,
          class: "tag"
        )
      end

      def test_render_with_inline_text
        component = TagComponent.new("Test text")
        render_inline(component)
        assert_component_rendered
        assert_selector(
          "span",
          text: "Test text",
          count: 1,
          visible: true,
          class: "tag"
        )
      end

      def test_boolish_variants
        {
          light: "is-light",
          hoverable: "is-hoverable",
          rounded: "is-rounded",
          delete: "is-delete"
        }.each do |variant, class_name|
          component = TagComponent.new("Test text", variant => true)
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "span",
            text: "Test text",
            count: 1,
            visible: true,
            class: ["tag", class_name]
          )
        end
      end

      def test_color_variant
        %i[black dark white primary link info success warning danger].each do |color|
          component = TagComponent.new("Test text", color: color)
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "span",
            text: "Test text",
            count: 1,
            visible: true,
            class: ["tag", "is-#{color}"]
          )
        end
      end

      def test_size_variant
        %i[small normal medium large].each do |size|
          component = TagComponent.new("Test text", size: size)
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "span",
            text: "Test text",
            count: 1,
            visible: true,
            class: ["tag", "is-#{size}"]
          )
        end
      end
    end
  end
end
