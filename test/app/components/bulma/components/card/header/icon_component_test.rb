require "test_helper"

module Bulma
  module Components
    module Card
      module Header
        class IconComponentTest < ViewComponents::TestCase
          def test_render_component
            component = IconComponent.new
            render_inline(component) { "Test text" }
            assert_component_rendered
            assert_selector("button", text: "Test text", count: 1, visible: true, class: "card-header-icon")
          end
        end
      end
    end
  end
end
