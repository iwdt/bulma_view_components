require "test_helper"

module Bulma
  module Elements
    class BlockComponentTest < ViewComponents::TestCase
      def test_render_component
        component = BlockComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector(
          "div",
          text: "Test text",
          count: 1,
          visible: true,
          class: "block"
        )
      end
    end
  end
end
