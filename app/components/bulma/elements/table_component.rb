module Bulma
  module Elements
    # The inevitable HTML table, with special case cells
    #
    # @see https://bulma.io/documentation/elements/table/ Bulma's documentation
    class TableComponent < ApplicationComponent
      # @dynamic table_header, with_table_header
      renders_one :table_header, Table::HeaderComponent
      # @dynamic table_body, with_table_body
      renders_one :table_body, Table::BodyComponent
      # @dynamic table_footer, with_table_footer
      renders_one :table_footer, Table::FooterComponent

      style do
        base { "table" }

        variants do
          # steep:ignore:start
          bordered do
            yes { "is-bordered" }
          end
          striped do
            yes { "is-striped" }
          end
          narrow do
            yes { "is-narrow" }
          end
          hoverable do
            yes { "is-hoverable" }
          end
          fullwidth do
            yes { "is-fullwidth" }
          end
          # steep:ignore:end
        end
      end

      style(:container) do
        base { "table-container" }
      end

      # @param scrollable [Boolean] You can create a scrollable table by wrapping a table in a table-container element.
      # @param bordered [Boolean] Add borders to all the cells.
      # @param striped [Boolean] Add stripes to the table.
      # @param narrow [Boolean] Make the cells narrower.
      # @param hoverable [Boolean] You can add a hover effect on each row
      # @param fullwidth [Boolean] You can have a fullwidth table.
      #
      # @param **html_attributes [Hash] Component attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(scrollable: false, bordered: false, striped: false, narrow: false, hoverable: false, fullwidth: false, **html_attributes)
        @bordered = bordered
        @striped = striped
        @narrow = narrow
        @hoverable = hoverable
        @fullwidth = fullwidth
        @scrollable = scrollable

        super(**html_attributes)
      end

      def call
        table = content_tag(
          :table,
          safe_join([table_header, table_body, table_footer]),
          **root_attributes(
            bordered: @bordered,
            striped: @striped,
            narrow: @narrow,
            hoverable: @hoverable,
            fullwidth: @fullwidth
          )
        )

        if @scrollable
          content_tag root_tag, table, class: style(:container)
        else
          table
        end
      end

      private :with_table_header
      def header(**html_attributes, &block)
        with_table_header(**html_attributes, &block)
      end

      private :with_table_body
      def body(**html_attributes, &block)
        with_table_body(**html_attributes, &block)
      end

      private :with_table_footer
      def footer(**html_attributes, &block)
        with_table_footer(**html_attributes, &block)
      end
    end
  end
end
