module Bulma
  module Components
    module Card
      module Header
        class TitleComponent < ApplicationComponent
          self.root_tag = :p

          style do
            base { "card-header-title" }
            variants do
              # steep:ignore:start
              centered do
                yes { "is-centered" }
              end
              # steep:ignore:end
            end
          end

          def initialize(text = nil, centered: false, **html_attributes)
            @text = text
            @centered = centered
            super(**html_attributes)
          end

          def call
            content_tag(root_tag, safe_join([@text, content]), **root_attributes(centered: @centered))
          end
        end
      end
    end
  end
end
