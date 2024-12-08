require "test_helper"

module Bulma
  module Components
    module Card
      module Header
        class TitleComponentTest < ViewComponents::TestCase
          def test_render_component
            component = TitleComponent.new("Test text")
            render_inline(component)
            assert_component_rendered
            assert_selector("p", text: "Test text", count: 1, visible: true, class: "card-header-title")
          end

          def test_render_component_with_content
            component = TitleComponent.new
            render_inline(component) { "Test text" }
            assert_component_rendered
            assert_selector("p", text: "Test text", count: 1, visible: true, class: "card-header-title")
          end

          def test_centered_variant
            component = TitleComponent.new("Test text", centered: true)
            render_inline(component)
            assert_component_rendered
            assert_selector("p", text: "Test text", count: 1, visible: true, class: ["card-header-title", "is-centered"])
          end
        end
      end
    end
  end
end
