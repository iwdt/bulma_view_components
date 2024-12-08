module Bulma
  module Elements
    module Table
      # Table col component
      #
      # @see https://developer.mozilla.org/docs/Web/HTML/Element/td
      class ColComponent < ApplicationComponent
        self.root_tag = :td

        style do
          variants do
            # steep:ignore:start
            color do
              primary { "is-primary" }
              link { "is-link" }
              info { "is-info" }
              success { "is-success" }
              warning { "is-warning" }
              danger { "is-danger" }
              black { "is-black" }
              dark { "is-dark" }
              light { "is-light" }
              white { "is-white" }
            end
            # steep:ignore:end
          end
        end

        def initialize(text = nil, color: nil, **html_attributes)
          @text = text
          @color = color

          super(**html_attributes)
        end

        def call
          content_tag root_tag, safe_join([@text, content]), **root_attributes(color: @color)
        end
      end
    end
  end
end
