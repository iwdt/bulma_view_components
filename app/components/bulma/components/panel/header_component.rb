module Bulma
  module Components
    module Panel
      class HeaderComponent < ApplicationComponent
        self.root_tag = :p

        style do
          base { "panel-heading" }
        end

        def initialize(text = nil, **html_attributes)
          @text = text

          super(**html_attributes)
        end

        def call
          content_tag(root_tag, safe_join([@text, content]), **root_attributes)
        end
      end
    end
  end
end
