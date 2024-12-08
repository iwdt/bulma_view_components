require "test_helper"

module Bulma
  module Components
    class BreadcrumbComponentTest < ViewComponents::TestCase
      def test_render_component
        component = BreadcrumbComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector("nav", text: "Test text", count: 1, visible: true, class: "breadcrumb")
      end

      def test_render_with_slots
        component = BreadcrumbComponent.new
        render_inline(component) do |breadcrumb|
          breadcrumb.item { link_to "Bulma", "#" }
          breadcrumb.item { link_to "Documentation", "#" }
          breadcrumb.item { link_to "Components", "#" }
          breadcrumb.item(active: true) { link_to "Breadcrumb", "#", aria: {current: :page} }
        end
        assert_component_rendered
        assert_selector("nav", count: 1, visible: true, class: "breadcrumb")
        assert_selector("nav>ul", count: 1, visible: true)
        assert_selector("nav>ul>li>a[href='#']", text: "Bulma", count: 1, visible: true)
        assert_selector("nav>ul>li>a[href='#']", text: "Documentation", count: 1, visible: true)
        assert_selector("nav>ul>li>a[href='#']", text: "Components", count: 1, visible: true)
        assert_selector("nav>ul>li.is-active>a[href='#'][aria-current='page']", text: "Breadcrumb", count: 1, visible: true)
      end

      def test_alignment_variant
        %i[centered right].each do |alignment|
          component = BreadcrumbComponent.new(alignment: alignment)
          render_inline(component)
          assert_component_rendered
          assert_selector("nav", count: 1, visible: true, class: ["breadcrumb", "is-#{alignment}"])
        end
      end

      def test_separator_variant
        %i[arrow bullet dot succeeds].each do |separator|
          component = BreadcrumbComponent.new(separator: separator)
          render_inline(component)
          assert_component_rendered
          assert_selector("nav", count: 1, visible: true, class: ["breadcrumb", "has-#{separator}-separator"])
        end
      end

      def test_size_variant
        %i[small normal medium large].each do |size|
          component = BreadcrumbComponent.new(size: size)
          render_inline(component)
          assert_component_rendered
          assert_selector("nav", count: 1, visible: true, class: ["breadcrumb", "is-#{size}"])
        end
      end
    end
  end
end
