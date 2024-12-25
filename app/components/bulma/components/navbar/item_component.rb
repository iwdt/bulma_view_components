module Bulma
  module Components
    module Navbar
      class ItemComponent < ApplicationComponent
        style :base do
          base { "navbar-item" }

          variants do
            # steep:ignore:start
            expanded do
              yes { "is-expanded" }
            end
            tab do
              yes { "is-tab" }
            end
            selected do
              yes { "is-selected" }
            end
            # steep:ignore:end
          end
        end

        def initialize(expanded: false, tab: false, selected: false, **html_attributes)
          @expanded = expanded
          @tab = tab
          @selected = selected

          super(**html_attributes)
        end

        def call
          content_tag(
            root_tag,
            content,
            **root_attributes(:base, **variants)
          )
        end

        private

        def variants
          {expanded: @expanded, tab: @tab, selected: @selected}
        end
      end
    end
  end
end
