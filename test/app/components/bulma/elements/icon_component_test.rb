require "test_helper"

module Bulma
  module Elements
    class IconComponentTest < ViewComponents::TestCase
      def test_render_component
        component = IconComponent.new
        render_inline(component)
        assert_component_rendered
        assert_selector("span", count: 1, visible: true, class: "icon")
      end

      def test_render_component_with_content
        component = IconComponent.new
        render_inline(component) { "Icon" }
        assert_component_rendered
        assert_selector("span", count: 1, text: "Icon", visible: true, class: "icon")
      end

      def test_size_variant
        %i[small normal medium large].each do |size|
          component = IconComponent.new(size: size)
          render_inline(component)
          assert_component_rendered
          assert_selector("span", count: 1, visible: true, class: ["icon", "is-#{size}"])
        end
      end
    end
  end
end
