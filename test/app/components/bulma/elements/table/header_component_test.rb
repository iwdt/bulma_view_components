require "test_helper"

module Bulma
  module Elements
    module Table
      class HeaderComponentTest < ViewComponents::TestCase
        def test_render_component
          component = HeaderComponent.new
          render_inline(component) do |body|
            body.row do |r|
              r.col "Col#1"
              r.col "Col#2"
              r.col "Col#3"
            end
          end
          assert_component_rendered
          assert_selector("thead", count: 1, visible: true)
          (1..3).each do |col|
            assert_selector "thead>tr>th", text: "Col##{col}", count: 1, visible: true
          end
        end

        def test_render_component_with_content
          component = HeaderComponent.new
          render_inline(component) { "Test text" }
          assert_component_rendered
          assert_selector("thead", text: "Test text", count: 1, visible: true)
        end

        def test_cols_tag
          component = HeaderComponent.new(cols_tag: :span)
          render_inline(component) do |body|
            body.row do |r|
              r.col "Col#1"
              r.col "Col#2"
              r.col "Col#3"
            end
          end
          assert_component_rendered
          assert_selector("thead", count: 1, visible: true)
          (1..3).each do |col|
            assert_selector "thead>tr>span", text: "Col##{col}", count: 1, visible: true
          end
        end
      end
    end
  end
end
