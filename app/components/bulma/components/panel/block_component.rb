module Bulma
  module Components
    module Panel
      class BlockComponent < ApplicationComponent
        # @dynamic panel_icon, with_panel_icon
        renders_one :panel_icon, IconComponent

        style do
          base { "panel-block" }

          variants do
            # steep:ignore:start
            active { "is-active" }
            # steep:ignore:end
          end
        end

        def initialize(active: false, **html_attributes)
          @active = active

          super(**html_attributes)
        end

        def call
          content_tag(root_tag, safe_join([panel_icon, content]), **root_attributes)
        end

        private :with_panel_icon
        def icon(**html_attributes, &block)
          with_panel_icon(**html_attributes, &block)
        end
      end
    end
  end
end
