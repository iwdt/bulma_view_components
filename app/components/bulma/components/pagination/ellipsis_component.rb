module Bulma
  module Components
    module Pagination
      class EllipsisComponent < ApplicationComponent
        ELLIPSIS_ENTITY_NAME = "&hellip;".html_safe

        self.root_tag = :li

        style do
          base { "pagination-ellipsis" }
        end

        def initialize(text = ELLIPSIS_ENTITY_NAME, **html_attributes)
          @text = text
          super(**html_attributes)
        end

        def call
          content_tag root_tag do
            content_tag(
              :span,
              content? ? content : @text,
              **root_attributes
            )
          end
        end
      end
    end
  end
end
