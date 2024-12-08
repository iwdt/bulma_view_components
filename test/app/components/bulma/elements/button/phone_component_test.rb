require "test_helper"

module Bulma
  module Elements
    module Button
      class PhoneComponentTest < ViewComponents::TestCase
        def test_render_component
          component = PhoneComponent.new("123456789", "Example phone")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='tel:123456789']",
            text: "Example phone",
            count: 1,
            visible: true,
            class: "button"
          )
        end

        def test_render_component_with_content
          component = PhoneComponent.new("123456789", {data: {controller: "test_controller"}})
          render_inline(component) { "Example phone" }

          assert_component_rendered
          assert_selector(
            "a[href='tel:123456789'][data-controller='test_controller']",
            text: "Example phone",
            count: 1,
            visible: true,
            class: "button"
          )
        end

        def test_render_componenet_only_first_param
          component = PhoneComponent.new("123456789")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='tel:123456789']",
            text: "123456789",
            count: 1,
            visible: true,
            class: "button"
          )
        end

        def test_render_componenet_only_first_param_with_content
          component = PhoneComponent.new("123456789")
          render_inline(component) { "Example phone" }
          assert_component_rendered
          assert_selector(
            "a[href='tel:123456789']",
            text: "Example phone",
            count: 1,
            visible: true,
            class: "button"
          )
        end

        def test_render_componenet_only_second_param
          component = PhoneComponent.new(nil, "123456789")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='tel:']",
            text: "123456789",
            count: 1,
            visible: true,
            class: "button"
          )
        end
      end
    end
  end
end
