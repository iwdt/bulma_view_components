module Bulma
  module Components
    module Modal
      module Card
        module Header
          class TitleComponent < ApplicationComponent
            self.root_tag = :p

            style do
              base { "modal-card-title" }
            end

            def initialize(text = nil, centered: false, **html_attributes)
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
  end
end
