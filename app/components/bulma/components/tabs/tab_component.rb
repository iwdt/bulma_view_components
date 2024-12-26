module Bulma
  module Components
    module Tabs
      class TabComponent < ApplicationComponent
        self.root_tag = :li

        # @dynamic tab_icon, with_tab_icon
        renders_one :tab_icon, Elements::IconComponent

        style :tab_wrapper do
          variants do
            # steep:ignore:start
            active do
              yes { "is-active" }
            end
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
          content_tag root_tag, tab_link, class: style(:tab_wrapper, active: @active)
        end

        def icon(**html_attributes, &block)
          with_tab_icon(**html_attributes, &block)
        end

        private

        def tab_link
          html_options = root_attributes

          if content?
            html_options = @options.merge(html_options) if @options.is_a?(Hash)

            return link_to(@name, html_options) { safe_join([tab_icon, content]) }
          end

          link_to(@name, @options, html_options)
        end
      end
    end
  end
end
