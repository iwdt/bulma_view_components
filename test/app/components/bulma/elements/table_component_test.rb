require "test_helper"

module Bulma
  module Elements
    class TableComponentTest < ViewComponents::TestCase
      def test_render_component
        component = TableComponent.new
        render_inline(component) do |table|
          table.header do |head|
            head.row do |r|
              r.col "Head#1"
              r.col "Head#2"
              r.col "Head#3"
            end
          end
          table.body do |body|
            body.row do |r|
              r.col "Col#1"
              r.col "Col#2"
              r.col "Col#3"
            end
          end
          table.footer do |foot|
            foot.row do |r|
              r.col "Foot#1"
              r.col "Foot#2"
              r.col "Foot#3"
            end
          end
        end
        assert_component_rendered
        assert_selector("table", count: 1, visible: true, class: "table")
        (1..3).each do |col|
          assert_selector "table>thead>tr>th", text: "Head##{col}"
          assert_selector "table>tbody>tr>td", text: "Col##{col}"
          assert_selector "table>tfoot>tr>th", text: "Foot##{col}"
        end
      end

      def test_scrollable_variant
        component = TableComponent.new(scrollable: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "table-container")
        assert_selector(".table-container>table", count: 1, visible: true, class: "table")
      end

      def test_bordered_variant
        component = TableComponent.new(bordered: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("table", count: 1, visible: true, class: ["table", "is-bordered"])
      end

      def test_striped_variant
        component = TableComponent.new(striped: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("table", count: 1, visible: true, class: ["table", "is-striped"])
      end

      def test_narrow_variant
        component = TableComponent.new(narrow: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("table", count: 1, visible: true, class: ["table", "is-narrow"])
      end

      def test_hoverable_variant
        component = TableComponent.new(hoverable: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("table", count: 1, visible: true, class: ["table", "is-hoverable"])
      end

      def test_fullwidth_variant
        component = TableComponent.new(fullwidth: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("table", count: 1, visible: true, class: ["table", "is-fullwidth"])
      end
    end
  end
end
