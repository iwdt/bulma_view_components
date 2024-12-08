require "test_helper"

module Bulma
  module Elements
    module Table
      class ColComponentTest < ViewComponents::TestCase
        def test_render_component
          component = ColComponent.new("Test text")
          render_inline(component)
          assert_component_rendered
          assert_selector "td", text: "Test text", count: 1, visible: true
        end

        def test_render_component_with_content
          component = ColComponent.new
          render_inline(component) { "Test text" }
          assert_component_rendered
          assert_selector("td", text: "Test text", count: 1, visible: true)
        end

        def test_color_variant
          %i[primary link info success warning danger black dark light white].each do |color|
            component = ColComponent.new(color: color)
            render_inline(component)
            assert_component_rendered
            assert_selector("td", count: 1, visible: true, class: "is-#{color}")
          end
        end
      end
    end
  end
end
