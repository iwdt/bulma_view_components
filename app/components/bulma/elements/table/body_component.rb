module Bulma
  module Elements
    module Table
      # Table body component
      #
      # @see https://developer.mozilla.org/docs/Web/HTML/Element/tbody
      class BodyComponent < ApplicationComponent
        self.root_tag = :tbody

        # @dynamic with_table_row, with_table_rows, table_rows
        renders_many :table_rows, ->(**html_attributes) do
          RowComponent.new(cols_tag: @cols_tag, **html_attributes) # steep:ignore
        end

        def initialize(cols_tag: :td, **html_attributes)
          @cols_tag = cols_tag

          super(**html_attributes)
        end

        def call
          content_tag root_tag, safe_join([*table_rows, content]), **root_attributes
        end

        private :with_table_row
        private :with_table_rows
        def row(**html_attributes, &block)
          with_table_row(**html_attributes, &block)
        end
      end
    end
  end
end
