module Bulma
  module Components
    module Pagination
      class NextComponent < ApplicationComponent
        style do
          base { "pagination-next" }
          variants do
            # steep:ignore:start
            disabled do
              yes { "is-disabled" }
            end
            # steep:ignore:end
          end
        end

        def initialize(name = nil, options = nil, disabled: false, **html_attributes)
          @name = name
          @options = options
          @disabled = disabled

          super(**html_attributes)
        end

        def call
          html_options = root_attributes(disabled: @disabled)

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
