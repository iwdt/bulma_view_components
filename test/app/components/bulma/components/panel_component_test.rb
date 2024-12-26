require "test_helper"

module Bulma
  module Components
    class PanelComponentTest < ViewComponents::TestCase
      def test_render_component
        component = PanelComponent.new color: :link
        render_inline(component) do |panel|
          panel.header "Repositories"
          panel.block { control }
          panel.tabs do |tabs|
            tabs.link_to "All", root_path, active: true
            tabs.link_to "Public", root_path(q: "public")
            tabs.link_to "Private", root_path(q: "private")
            tabs.link_to "Sources", root_path(q: "sources")
            tabs.link_to "Forks", root_path(q: "forks")
          end
          panel.link_to "https://github.com/jgthms/bulma", active: true do |link|
            link.icon { tag.i class: %w[fas fa-book], aria: :hidden }
            "bulma"
          end
          panel.link_to "https://github.com/jgthms/marksheet" do |link|
            link.icon { tag.i class: %w[fas fa-book], aria: :hidden }
            "marksheet"
          end
          panel.link_to "https://github.com/jgthms/minireset.css" do |link|
            link.icon { tag.i class: %w[fas fa-book], aria: :hidden }
            "minireset.css"
          end
          panel.link_to "https://jgthms.github.io" do |link|
            link.icon { tag.i class: %w[fas fa-book], aria: :hidden }
            "jgthms.github.io"
          end
          panel.link_to "https://github.com/rails/rails" do |link|
            link.icon { tag.i class: %w[fas fa-code-branch], aria: :hidden }
            "rails/rails"
          end
          panel.link_to "https://github.com/ViewComponent/view_component" do |link|
            link.icon { tag.i class: %w[fas fa-code-branch], aria: :hidden }
            "ViewComponent/view_component"
          end
          panel.label do |label|
            safe_join([checkbox, "remember me"])
          end
          panel.block do
            render Elements::ButtonComponent.new(
              "Reset all filters", type: :reset, color: :link, outlined: true, full_width: true
            )
          end
        end
        assert_component_rendered
        # TODO: Write more tests
      end

      private

      def checkbox
        tag.input type: "checkbox"
      end

      # TODO: Change to component
      def control
        tag.p class: %w[control has-icons-left] do
          safe_join([
            tag.input(class: "input", type: "text", placeholder: "Search"),
            search_icon
          ])
        end
      end

      def search_icon
        render Elements::IconComponent.new(left: true) do
          tag.i class: %w[fas fa-search], aria: {hidden: true}
        end
      end
    end
  end
end
