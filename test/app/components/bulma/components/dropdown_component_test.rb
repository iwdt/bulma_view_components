require "test_helper"

module Bulma
  module Components
    class DropdownComponentTest < ViewComponents::TestCase
      def test_render_component
        component = DropdownComponent.new
        render_inline(component) do |dropdown|
          dropdown.trigger do
            render Elements::ButtonComponent.new(type: :button, aria: {haspopup: true, controls: "dropdown-menu"}) do
              icon = Elements::IconComponent.new(size: :small) { tag.i(class: %i[fas fa-angle-down], aria: {hidden: true}) }
              safe_join([content_tag(:span, "Dropdown button"), render(icon)])
            end
          end
          dropdown.menu(id: "dropdown-menu", role: :menu) do |menu|
            menu.button_to "It's form tag", "https://rubyonrails.org"
            menu.link_to "Ruby on Rails", "https://rubyonrails.org"
            menu.sms_to("123456789") { "Sms me" }
            menu.phone_to "123456789", "Phone me"
            menu.mail_to "example@example.com", "Mail me"
            menu.divider
            menu.item(tag: :span) { "With a divider" }
          end
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "dropdown")
        assert_selector(".dropdown>div", count: 1, visible: true, class: "dropdown-trigger")
        assert_selector(".dropdown>div", count: 1, visible: true, class: "dropdown-menu")
        assert_selector(".dropdown>.dropdown-menu>div", count: 1, visible: true, class: "dropdown-content")

        assert_selector(
          ".dropdown>.dropdown-menu>.dropdown-content>form[action='https://rubyonrails.org'][method='post'].button_to>button[type='submit']", text: "It's form tag", count: 1, visible: true, class: "dropdown-item"
        )
        assert_selector(
          ".dropdown>.dropdown-menu>.dropdown-content>a[href='https://rubyonrails.org']", text: "Ruby on Rails", count: 1, visible: true, class: "dropdown-item"
        )
        assert_selector(".dropdown>.dropdown-menu>.dropdown-content>a[href='sms:123456789;']", text: "Sms me", count: 1, visible: true, class: "dropdown-item")
        assert_selector(".dropdown>.dropdown-menu>.dropdown-content>a[href='tel:123456789']", text: "Phone me", count: 1, visible: true, class: "dropdown-item")
        assert_selector(
          ".dropdown>.dropdown-menu>.dropdown-content>a[href='mailto:example@example.com']", text: "Mail me", count: 1, visible: true, class: "dropdown-item"
        )
        assert_selector(".dropdown>.dropdown-menu>.dropdown-content>hr", count: 1, visible: true, class: "dropdown-divider")
        assert_selector(
          ".dropdown>.dropdown-menu>.dropdown-content>span", text: "With a divider", count: 1, visible: true, class: "dropdown-item"
        )
      end
    end
  end
end
