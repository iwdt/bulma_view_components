module Bulma
  module Elements
    # Creates a button element that defines a `submit` button, reset button or a generic button which can be used
    # in JavaScript, for example. You can use the button tag as a regular `submit` tag but it isn’t supported in
    # legacy browsers. However, the button tag does allow for richer labels such as images and emphasis, so
    # this helper will also accept a block. By default, it will create a button tag with type `submit`, if type is not given.
    #
    # @see https://apidock.com/rails/ActionView/Helpers/FormTagHelper/button_tag Ruby on Rails `button_tag` documentation
    class ButtonComponent < Button::BaseComponent
      def initialize(content_or_options = nil, **html_attributes)
        @content_or_options = content_or_options

        super(**html_attributes)
      end

      def call
        if content?
          button_tag @content_or_options, root_attributes(:base, **variants) do
            content
          end
        else
          button_tag @content_or_options, root_attributes(:base, **variants)
        end
      end
    end
  end
end
