module Bulma
  module Elements
    module Button
      # Generates a form containing a single button that submits to the URL created by the set of `options`. This is the safest method to ensure links that cause changes to your data are not triggered by search bots or accelerators.
      #
      # You can control the form and button behavior with `html_attributes`. Most values in `html_attributes` are passed through to the button element. For example, passing a `:class` option within `html_attributes` will set the class attribute of the button element.
      #
      # The class attribute of the form element can be set by passing a `:form_class` option within `html_attributes`. It defaults to "button_to" to allow styling of the form and its children.
      #
      # The form submits a POST request by default. You can specify a different HTTP verb via the :method option within `html_attributes`.
      #
      # If the HTML button generated from button_to does not work with your layout, you can consider using the {Bulma::Elements::Button::LinkComponent} component with the `data-turbo-method` attribute as described in the {Bulma::Elements::Button::LinkComponent} documentation.
      #
      # @see https://apidock.com/rails/ActionView/Helpers/UrlHelper/button_to Ruby on Rails `button_to` documentation
      class FormComponent < BaseComponent
        def initialize(name = nil, options = nil, **html_attributes)
          @name = name
          @options = options

          super(**html_attributes)
        end

        def call
          html_options = root_attributes(:base, **variants)

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
