module Bulma
  module Components
    module Pagination
      class LinkComponent < ApplicationComponent
        self.root_tag = :li

        style do
          base { "pagination-link" }
          variants do
            # steep:ignore:start
            current do
              yes { "is-current" }
            end
            disabled do
              yes { "is-disabled" }
            end
            # steep:ignore:end
          end
        end

        def initialize(name = nil, options = nil, disabled: false, current: false, **html_attributes)
          @name = name
          @options = options
          @current = current
          @disabled = disabled

          super(**html_attributes)
        end

        def call
          content_tag(root_tag, pager_link)
        end

        private

        def pager_link
          html_options = root_attributes(current: @current, disabled: @disabled)

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
