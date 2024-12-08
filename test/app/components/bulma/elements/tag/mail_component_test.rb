require "test_helper"

module Bulma
  module Elements
    module Tag
      class MailComponentTest < ViewComponents::TestCase
        def test_render_component
          component = MailComponent.new("example@example.com", "Example email")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='mailto:example@example.com']",
            text: "Example email",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_component_with_content
          component = MailComponent.new("example@example.com", {data: {controller: "test_controller"}})
          render_inline(component) { "Example email" }

          assert_component_rendered
          assert_selector(
            "a[href='mailto:example@example.com'][data-controller='test_controller']",
            text: "Example email",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_componenet_only_first_param
          component = MailComponent.new("example@example.com")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='mailto:example@example.com']",
            text: "example@example.com",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_componenet_only_first_param_with_content
          component = MailComponent.new("example@example.com")
          render_inline(component) { "Example email" }
          assert_component_rendered
          assert_selector(
            "a[href='mailto:example@example.com']",
            text: "Example email",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_componenet_only_second_param
          component = MailComponent.new(nil, "example@example.com")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='mailto:']",
            text: "example@example.com",
            count: 1,
            visible: true,
            class: "tag"
          )
        end
      end
    end
  end
end
