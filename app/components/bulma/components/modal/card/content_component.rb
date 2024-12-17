module Bulma
  module Components
    module Modal
      module Card
        class ContentComponent < ApplicationComponent
          self.root_tag = :section

          style do
            base { "modal-card-body" }
          end
        end
      end
    end
  end
end
