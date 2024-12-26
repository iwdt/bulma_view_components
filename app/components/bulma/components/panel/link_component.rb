module Bulma
  module Components
    module Panel
      class LinkComponent < ApplicationComponent
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

        def initialize(name = nil, options = nil, active: false, **html_attributes)
          @name = name
          @options = options
          @active = active

          super(**html_attributes)
        end

        def call
          html_options = root_attributes(active: @active)

          if content?
            html_options = @options.merge(html_options) if @options.is_a?(Hash)

            return link_to(@name, html_options) { safe_join([panel_icon, content]) }
          end

          link_to(@name, @options, html_options)
        end

        private :with_panel_icon
        def icon(**html_attributes, &block)
          with_panel_icon(**html_attributes, &block)
        end
      end
    end
  end
end
