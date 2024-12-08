require "test_helper"

module Bulma
  module Elements
    module Tag
      class SmsComponentTest < ViewComponents::TestCase
        def test_render_component
          component = SmsComponent.new("123456789", "Example phone")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='sms:123456789;']",
            text: "Example phone",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_component_with_content
          component = SmsComponent.new("123456789", {data: {controller: "test_controller"}})
          render_inline(component) { "Example phone" }

          assert_component_rendered
          assert_selector(
            "a[href='sms:123456789;'][data-controller='test_controller']",
            text: "Example phone",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_componenet_only_first_param
          component = SmsComponent.new("123456789")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='sms:123456789;']",
            text: "123456789",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_componenet_only_first_param_with_content
          component = SmsComponent.new("123456789")
          render_inline(component) { "Example phone" }
          assert_component_rendered
          assert_selector(
            "a[href='sms:123456789;']",
            text: "Example phone",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_componenet_only_second_param
          component = SmsComponent.new(nil, "123456789")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='sms:;']",
            text: "123456789",
            count: 1,
            visible: true,
            class: "tag"
          )
        end
      end
    end
  end
end
