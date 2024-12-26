require "test_helper"

module Bulma
  module Components
    class PaginationComponentTest < ViewComponents::TestCase
      def test_render_component
        component = PaginationComponent.new
        render_inline(component) do |pager|
          pager.prev "Previous", "#"
          pager.next "Next page", "#"

          pager.page 1, "#", aria: {label: "Goto page 1"}
          pager.ellipsis
          pager.page("#", aria: {label: "Goto page 45"}) { "45" }
          pager.page 46, "#", current: true, aria: {current: :page, label: "Current page"}
          pager.page 47, "#", aria: {label: "Goto page 47"}
          pager.ellipsis { tag.b("...") }
          pager.page 86, "#", aria: {label: "Goto page 86"}
        end
        assert_component_rendered
        # TODO: Write more tests
      end
    end
  end
end
