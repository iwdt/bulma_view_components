require "test_helper"

module Bulma
  module Elements
    class BoxComponentTest < ViewComponents::TestCase
      def test_render_component
        component = BoxComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector(
          "div",
          text: "Test text",
          count: 1,
          visible: true,
          class: "box"
        )
      end
    end
  end
end
