require "test_helper"

module Bulma
  module Components
    module Card
      class ImageComponentTest < ViewComponents::TestCase
        def test_render_component
          component = ImageComponent.new
          render_inline(component) { "Test text" }
          assert_component_rendered
          assert_selector("div", text: "Test text", count: 1, visible: true, class: "card-image")
        end
      end
    end
  end
end
