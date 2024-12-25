module Bulma
  module Components
    module Navbar
      module Item
        module Dropdown
          class TriggerComponent < ApplicationComponent
            style do
              base { "navbar-link" }

              variants do
                # steep:ignore:start
                arrowless do
                  yes { "is-arrowless" }
                end
                # steep:ignore:end
              end
            end

            def initialize(name = nil, options = nil, arrowless: false, **html_attributes)
              @name = name
              @options = options
              @arrowless = arrowless

              super(**html_attributes)
            end

            def call
              html_options = root_attributes(arrowless: @arrowless)

              if !content? && !@name.nil?
                return tag.a @name, **html_options
              end

              if content?
                html_options = @options.merge(root_attributes) if @options.is_a?(Hash)

                return link_to(@name, html_options) { content }
              end

              link_to(@name, @options, html_options)
            end
          end
        end
      end
    end
  end
end
