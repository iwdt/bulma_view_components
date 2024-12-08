require "test_helper"

module Bulma
  module Elements
    class ContentComponentTest < ViewComponents::TestCase
      def test_render_component
        component = ContentComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector(
          "div",
          text: "Test text",
          count: 1,
          visible: true,
          class: "content"
        )
      end
    end
  end
end
