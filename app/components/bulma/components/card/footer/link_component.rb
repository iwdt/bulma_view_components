module Bulma
  module Components
    module Card
      module Footer
        class LinkComponent < ItemComponent
          def initialize(name = nil, options = nil, **html_attributes)
            @name = name
            @options = options

            super(**html_attributes)
          end

          def call
            html_options = root_attributes(:item)

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
