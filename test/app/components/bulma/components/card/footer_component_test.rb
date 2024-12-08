require "test_helper"

module Bulma
  module Components
    module Card
      class FooterComponentTest < ViewComponents::TestCase
        def test_render_component
          component = FooterComponent.new
          render_inline(component) { "Test text" }
          assert_component_rendered
          assert_selector("footer", text: "Test text", count: 1, visible: true, class: "card-footer")
        end
      end
    end
  end
end
