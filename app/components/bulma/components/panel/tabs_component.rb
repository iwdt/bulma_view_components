module Bulma
  module Components
    module Panel
      class TabsComponent < ApplicationComponent
        self.root_tag = :p

        # @dynamic panel_tabs, with_panel_tab
        renders_many :panel_tabs, TabComponent

        style do
          base { "panel-tabs" }
        end

        def call
          content_tag(root_tag, safe_join(panel_tabs), **root_attributes)
        end

        private :with_panel_tab
        def link_to(name = nil, options = nil, **html_attributes, &block)
          with_panel_tab(name, options, **html_attributes, &block)
        end
      end
    end
  end
end
