require "test_helper"

module Bulma
  module Elements
    module Table
      class RowComponentTest < ViewComponents::TestCase
        def test_render_component
          component = RowComponent.new
          render_inline(component) do |r|
            r.col "Col#1"
            r.col "Col#2"
            r.col "Col#3"
          end
          assert_component_rendered
          assert_selector("tr", count: 1, visible: true)
          (1..3).each do |col|
            assert_selector "tr>td", text: "Col##{col}", count: 1, visible: true
          end
        end

        def test_render_component_with_content
          component = RowComponent.new
          render_inline(component) { "Test text" }
          assert_component_rendered
          assert_selector("tr", text: "Test text", count: 1, visible: true)
        end

        def test_cols_tag
          component = RowComponent.new(cols_tag: :span)
          render_inline(component) do |r|
            r.col "Col#1"
            r.col "Col#2"
            r.col "Col#3"
          end
          assert_component_rendered
          assert_selector("tr", count: 1, visible: true)
          (1..3).each do |col|
            assert_selector "tr>span", text: "Col##{col}", count: 1, visible: true
          end
        end

        def test_color_variant
          %i[primary link info success warning danger black dark light white].each do |color|
            component = RowComponent.new(color: color)
            render_inline(component)
            assert_component_rendered
            assert_selector("tr", count: 1, visible: true, class: "is-#{color}")
          end
        end

        def test_selected_variant
          component = RowComponent.new(selected: true)
          render_inline(component)
          assert_component_rendered
          assert_selector("tr", count: 1, visible: true, class: "is-selected")
        end
      end
    end
  end
end
