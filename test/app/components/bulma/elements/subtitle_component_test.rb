require "test_helper"

module Bulma
  module Elements
    class SubtitleComponentTest < ViewComponents::TestCase
      def test_render_component
        component = SubtitleComponent.new("Test text")
        render_inline(component)
        assert_component_rendered
        assert_selector("h1", text: "Test text", count: 1, visible: true, class: "subtitle")
      end

      def test_render_component_with_content
        component = SubtitleComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector("h1", text: "Test text", count: 1, visible: true, class: "subtitle")
      end

      def test_size_variant
        (1..6).each do |size|
          component = SubtitleComponent.new("Test text", size: size)
          render_inline(component)
          assert_component_rendered
          assert_selector("h#{size}", text: "Test text", count: 1, visible: true, class: ["subtitle", "is-#{size}"])
        end
      end

      def test_custom_tag
        component = SubtitleComponent.new("Test text", tag: :span, size: 4)
        render_inline(component)
        assert_component_rendered
        assert_selector("span", text: "Test text", count: 1, visible: true, class: ["subtitle", "is-4"])
      end

      def test_spaced_variant
        component = SubtitleComponent.new("Test text", spaced: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("h1", text: "Test text", count: 1, visible: true, class: ["subtitle", "is-spaced"])
      end
    end
  end
end
