require "test_helper"

module Bulma
  module Components
    class MenuComponentTest < ViewComponents::TestCase
      def test_render_component
        component = MenuComponent.new
        render_inline(component) do |menu|
          menu.label "General"
          menu.list do |list|
            list.item { link_to "Dashboard", "#" }
            list.item { link_to "Customers", "#" }
          end
          menu.label "Adniminstration"
          menu.list do |list|
            list.item { link_to "Team settings", "#" }
            list.item do |item|
              item.list do |list|
                list.item { link_to "Members", "#" }
                list.item { link_to "Plugins", "#" }
                list.item { link_to "Add a member", "#" }
              end

              link_to("Manage Your Team", "#", class: "is-active")
            end
            list.item { link_to "Invitations", "#" }
            list.item { link_to "Cloud Storage Environment Settings", "#" }
            list.item { link_to "Authentication", "#" }
          end
          menu.label "Transactions"
          menu.list do |list|
            list.item { link_to "Payments", "#" }
            list.item { link_to "Transfers", "#" }
            list.item { link_to "Balance", "#" }
          end
        end
        assert_component_rendered
        assert_selector("aside", count: 1, visible: true, class: "menu")
      end
    end
  end
end
