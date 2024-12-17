module Bulma
  module Components
    module Modal
      module Card
        class FooterComponent < ApplicationComponent
          self.root_tag = :footer

          style do
            base { "modal-card-foot" }
          end

          def call
            content_tag(root_tag, content, **root_attributes)
          end
        end
      end
    end
  end
end
