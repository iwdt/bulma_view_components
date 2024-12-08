module Bulma
  module Elements
    module Table
      # Table row component
      #
      # @see https://developer.mozilla.org/docs/Web/HTML/Element/tr
      # @see https://developer.mozilla.org/docs/Web/HTML/Element/th
      class RowComponent < ApplicationComponent
        self.root_tag = :tr

        style do
          variants do
            # steep:ignore:start
            selected do
              yes { "is-selected" }
            end
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

        # @dynamic with_table_col, with_table_cols, table_cols
        renders_many :table_cols, ->(text = nil, **html_attributes) do
          ColComponent.new(text, tag: @cols_tag, **html_attributes) # steep:ignore
        end

        def initialize(cols_tag: :td, color: nil, selected: false, **html_attributes)
          @cols_tag = cols_tag
          @selected = selected
          @color = color

          super(**html_attributes)
        end

        def call
          content_tag(
            root_tag,
            safe_join([*table_cols, content]),
            **root_attributes(selected: @selected, color: @color)
          )
        end

        private :with_table_col
        private :with_table_cols
        def col(text = nil, **html_attributes, &block)
          with_table_col(text, **html_attributes, &block)
        end
      end
    end
  end
end
