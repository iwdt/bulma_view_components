require "test_helper"

module Bulma
  module Elements
    class ButtonsComponentTest < ViewComponents::TestCase
      def test_render_component
        component = ButtonsComponent.new
        render_inline(component)
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "buttons")
      end

      def test_render_component_with_content
        component = ButtonsComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector("div", text: "Test text", count: 1, visible: true, class: "buttons")
      end

      def test_render_component_with_slots
        component = ButtonsComponent.new
        render_inline(component) do |buttons|
          buttons.button_tag "Button", type: :button
          buttons.button_to "It's form tag", "https://rubyonrails.org"
          buttons.link_to "Ruby on Rails", "https://rubyonrails.org"
          buttons.sms_to("123456789") { "Sms me" }
          buttons.phone_to "123456789", "Phone me"
          buttons.mail_to "example@example.com", "Mail me"
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "buttons")
        assert_selector("div>button[type='button']", text: "Button", count: 1, visible: true, class: "button")
        assert_selector(
          "form[action='https://rubyonrails.org'][method='post'].button_to>button[type='submit']", text: "It's form tag", count: 1, visible: true, class: "button"
        )
        assert_selector(
          "div>a[href='https://rubyonrails.org']", text: "Ruby on Rails", count: 1, visible: true, class: "button"
        )
        assert_selector("div>a[href='sms:123456789;']", text: "Sms me", count: 1, visible: true, class: "button")
        assert_selector("div>a[href='tel:123456789']", text: "Phone me", count: 1, visible: true, class: "button")
        assert_selector(
          "div>a[href='mailto:example@example.com']", text: "Mail me", count: 1, visible: true, class: "button"
        )
      end

      def test_alignment_variant
        {center: "is-centered", right: "is-right"}.each do |alignment, class_name|
          component = ButtonsComponent.new(alignment: alignment)
          render_inline(component)
          assert_component_rendered
          assert_selector("div", count: 1, visible: true, class: ["buttons", class_name])
        end
      end

      def test_addons_variant
        component = ButtonsComponent.new(addons: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: ["buttons", "has-addons"])
      end
    end
  end
end
