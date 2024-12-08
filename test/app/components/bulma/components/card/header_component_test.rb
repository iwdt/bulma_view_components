require "test_helper"

module Bulma
  module Components
    module Card
      class HeaderComponentTest < ViewComponents::TestCase
        def test_render_component
          component = HeaderComponent.new
          render_inline(component) { "Test text" }
          assert_component_rendered
          assert_selector("header", text: "Test text", count: 1, visible: true, class: "card-header")
        end
      end
    end
  end
end
