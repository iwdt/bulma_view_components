require "test_helper"

module Bulma
  module Elements
    class IconTextComponentTest < ViewComponents::TestCase
      def test_render_component
        component = IconTextComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector("div", text: "Test text", count: 1, visible: true, class: "icon-text")
      end
    end
  end
end
