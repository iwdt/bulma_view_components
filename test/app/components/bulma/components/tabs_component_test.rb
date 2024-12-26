require "test_helper"

module Bulma
  module Components
    class TabsComponentTest < ViewComponents::TestCase
      def test_render_component
        component = TabsComponent.new
        render_inline(component) do |tabs|
          tabs.link_to "Pictures", "/pictures", active: true
          tabs.link_to "/music" do |tab|
            tab.icon(size: :small) { tag.i(class: %w[fas fa-music], aria: {hidden: true}) }

            tag.span "Music"
          end
          tabs.link_to "/videos" do |tab|
            tab.icon(size: :small) { tag.i(class: %w[fas fa-film], aria: {hidden: true}) }

            tag.span "Videos"
          end
          tabs.link_to "/documents" do |tab|
            tab.icon(size: :small) { tag.i(class: %w[fas fa-file-alt], aria: {hidden: true}) }

            tag.span "Documents"
          end
        end
        assert_component_rendered
        # TODO: Write more tests
      end
    end
  end
end
