require "test_helper"

module Bulma
  module Components
    class NavbarComponentTest < ViewComponents::TestCase
      def test_render_component
        component = NavbarComponent.new
        render_inline(component) do |navbar|
          navbar.brand do |brand|
            brand.logo(root_path) { company_logo_svg }
            brand.burger role: :button, aria: {label: :menu, expanded: false}, data: {target: "navbar"}
          end
          navbar.menu id: "navbar" do |menu|
            menu.left do |left_menu|
              left_menu.link_to "Home", root_path
              left_menu.link_to "Documentation", "/docs"
              left_menu.dropdown hoverable: true do |dropdown|
                dropdown.trigger "More"
                dropdown.menu do |dropdown_menu|
                  dropdown_menu.item { "Simple block" }
                  dropdown_menu.link_to "About", "/about"
                  dropdown_menu.phone_to "1234567890", "Phone without block"
                  dropdown_menu.phone_to("1234567890") { tag.i("Phone with block") }
                  dropdown_menu.sms_to "1234567890", "SMS without block", selected: true
                  dropdown_menu.sms_to("1234567890") { tag.i("SMS with block") }
                  dropdown_menu.mail_to "example@example.com", "Mail without block"
                  dropdown_menu.mail_to("example@example.com") { tag.i("Mail with block") }
                  dropdown_menu.divider
                  dropdown_menu.button_to "Form without block", "https://rubyonrails.org"
                  dropdown_menu.button_to("https://rubyonrails.org") { "Form with block" }
                end
              end
            end
            menu.right do |right_menu|
              right_menu.item do
                render Elements::ButtonsComponent.new do |buttons|
                  buttons.link_to "/sign_up", color: :primary do
                    tag.strong "Sign up"
                  end
                  buttons.link_to "Log in", "/login", theme: :light
                end
              end
            end
          end
        end
        assert_component_rendered
        # TODO: Write more tests
      end

      private

      def company_logo_svg
        tag.svg width: 640, height: 160, viewBox: "0 0 640 160", fill: "none", xmlns: "http://www.w3.org/2000/svg" do
          # ... path ...
          # ... path ...
        end
      end
    end
  end
end
