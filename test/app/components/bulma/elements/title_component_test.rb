require "test_helper"

module Bulma
  module Elements
    class TitleComponentTest < ViewComponents::TestCase
      def test_render_component
        component = TitleComponent.new("Test text")
        render_inline(component)
        assert_component_rendered
        assert_selector("h1", text: "Test text", count: 1, visible: true, class: "title")
      end

      def test_render_component_with_content
        component = TitleComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector("h1", text: "Test text", count: 1, visible: true, class: "title")
      end

      def test_size_variant
        (1..6).each do |size|
          component = TitleComponent.new("Test text", size: size)
          render_inline(component)
          assert_component_rendered
          assert_selector("h#{size}", text: "Test text", count: 1, visible: true, class: ["title", "is-#{size}"])
        end
      end

      def test_custom_tag
        component = TitleComponent.new("Test text", tag: :span, size: 4)
        render_inline(component)
        assert_component_rendered
        assert_selector("span", text: "Test text", count: 1, visible: true, class: ["title", "is-4"])
      end

      def test_spaced_variant
        component = TitleComponent.new("Test text", spaced: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("h1", text: "Test text", count: 1, visible: true, class: ["title", "is-spaced"])
      end
    end
  end
end
