module Bulma
  module Elements
    module Tag
      class FormComponent < BaseComponent
        FORM_STYLE_FIXES = [
          "height: 100%;",
          "margin-left: -0.75em;",
          "margin-right: -0.75em;",
          "padding-left: 0.75em;",
          "padding-right: 0.75em;"
        ].freeze

        style :button do
          base { "is-clearfix" }
        end

        def initialize(name = nil, options = nil, hoverable: true, **html_attributes)
          @name = name
          @options = options
          super(hoverable: hoverable, **html_attributes)
        end

        def call
          html_options = @root_attributes.merge(
            class: style(:button),
            style: [FORM_STYLE_FIXES, @root_attributes[:style]],
            form_class: root_style(:base, **variants)
          )

          if content?
            html_options = @options.merge(html_options) if @options.is_a?(Hash)
            return button_to(@name, html_options) { content }
          end

          button_to(@name, @options, html_options)
        end
      end
    end
  end
end
