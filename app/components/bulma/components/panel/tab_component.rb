module Bulma
  module Components
    module Panel
      class TabComponent < ApplicationComponent
        style do
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
          html_options = root_attributes(active: @active)

          if content?
            html_options = @options.merge(html_options) if @options.is_a?(Hash)

            return link_to(@name, html_options) { content }
          end

          link_to(@name, @options, html_options)
        end
      end
    end
  end
end
