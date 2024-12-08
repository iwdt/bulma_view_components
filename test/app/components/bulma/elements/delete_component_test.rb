require "test_helper"

module Bulma
  module Elements
    class DeleteComponentTest < ViewComponents::TestCase
      def test_render_component
        component = DeleteComponent.new
        render_inline(component)
        assert_component_rendered
        assert_selector("button", count: 1, visible: true, class: "delete")
      end

      def test_size_variant
        %i[small normal medium large].each do |size|
          component = DeleteComponent.new(size: size)
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "button",
            count: 1,
            visible: true,
            class: ["delete", "is-#{size}"]
          )
        end
      end
    end
  end
end
