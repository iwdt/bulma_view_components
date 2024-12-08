module Bulma
  module Elements
    module Button
      # Creates a TEL anchor link tag to the specified `phone_number`. When the link is clicked, the default app to make phone calls is opened and prepopulated with the phone number.
      #
      # If `name` is not specified, `phone_number` will be used as the name of the link.
      #
      # A `country_code` option is supported, which prepends a plus sign and the given country code to the linked phone number. For example, `country_code: "01"` will prepend `+01` to the linked phone number.
      #
      # Additional HTML attributes for the link can be passed via `html_attributes`.
      #
      # @see https://apidock.com/rails/ActionView/Helpers/UrlHelper/phone_to Ruby on Rails `phone_to` documentation
      class PhoneComponent < BaseComponent
        def initialize(phone_number = nil, name = nil, **html_attributes)
          @phone_number = phone_number
          @name = name

          super(**html_attributes)
        end

        def call
          html_options = root_attributes(:base, **variants)

          if content?
            html_options = @name.merge(html_options) if @name.is_a?(Hash)
            return phone_to(@phone_number, html_options) { content }
          end

          phone_to(@phone_number, @name, html_options)
        end
      end
    end
  end
end
