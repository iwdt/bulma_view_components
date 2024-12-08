require "test_helper"

module Bulma
  module Elements
    class ProgressComponentTest < ViewComponents::TestCase
      def test_render_component
        component = ProgressComponent.new(32)
        render_inline(component)
        assert_component_rendered
        assert_selector("progress[value=32]", text: "32%", count: 1, visible: true, class: "progress")
      end

      def test_render_component_without_value_and_content
        component = ProgressComponent.new
        render_inline(component)
        assert_component_rendered
        assert_selector("progress", text: "", count: 1, visible: true, class: "progress")
      end

      def test_render_component_with_content
        component = ProgressComponent.new(32)
        render_inline(component) { "Progress is 32" }
        assert_component_rendered
        assert_selector("progress[value=32]", text: "Progress is 32", count: 1, visible: true, class: "progress")
      end

      def test_render_component_without_value
        component = ProgressComponent.new
        render_inline(component) { "Progress is 32" }
        assert_component_rendered
        assert_selector("progress", text: "Progress is 32", count: 1, visible: true, class: "progress")
      end

      def test_render_component_with_value_attribute
        component = ProgressComponent.new(value: 32)
        render_inline(component) { "Progress is 32" }
        assert_component_rendered
        assert_selector("progress[value=32]", text: "Progress is 32", count: 1, visible: true, class: "progress")
      end

      def test_color_variant
        %i[link primary info success warning danger light].each do |color|
          component = ProgressComponent.new(32, color: color)
          render_inline(component)
          assert_component_rendered
          assert_selector("progress[value=32]", text: "32%", count: 1, visible: true, class: ["progress", "is-#{color}"])
        end
      end

      def test_size_variant
        %i[small normal medium large].each do |size|
          component = ProgressComponent.new(32, size: size)
          render_inline(component)
          assert_component_rendered
          assert_selector("progress[value=32]", text: "32%", count: 1, visible: true, class: ["progress", "is-#{size}"])
        end
      end
    end
  end
end
