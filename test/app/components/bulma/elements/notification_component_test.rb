require "test_helper"

module Bulma
  module Elements
    class NotificationComponentTest < ViewComponents::TestCase
      def test_render_component
        component = NotificationComponent.new("Test text")
        render_inline(component) do |notification|
          notification.close
        end
        assert_component_rendered
        assert_selector("div", text: "Test text", count: 1, visible: true, class: "notification")
        assert_selector(".notification>button", count: 1, visible: true, class: "delete")
      end

      def test_render_component_with_content
        component = NotificationComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector("div", text: "Test text", count: 1, visible: true, class: "notification")
      end

      def test_color_variant
        %i[link primary info success warning danger].each do |color|
          component = NotificationComponent.new("Test text", color: color)
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "div", text: "Test text", count: 1, visible: true, class: ["notification", "is-#{color}"]
          )
        end
      end

      def test_light_variant
        component = NotificationComponent.new("Test text", light: true)
        render_inline(component)
        assert_component_rendered
        assert_selector(
          "div", text: "Test text", count: 1, visible: true, class: ["notification", "is-light"]
        )
      end
    end
  end
end
