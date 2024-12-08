require "test_helper"

module Bulma
  module Components
    module Card
      module Footer
        class ItemComponentTest < ViewComponents::TestCase
          def test_render_component
            component = ItemComponent.new
            render_inline(component) { "Test text" }
            assert_component_rendered
            assert_selector("div", text: "Test text", count: 1, visible: true, class: "card-footer-item")
          end
        end
      end
    end
  end
end
