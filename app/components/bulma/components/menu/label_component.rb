module Bulma
  module Components
    module Menu
      class LabelComponent < ApplicationComponent
        self.root_tag = :p

        style do
          base { "menu-label" }
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
