module Bulma
  module Components
    module Dropdown
      module Menu
        class LinkComponent < ItemComponent
          def initialize(name = nil, options = nil, **html_attributes)
            @name = name
            @options = options

            super(**html_attributes)
          end

          def call
            html_options = root_attributes(:item, active: @active)

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
end
