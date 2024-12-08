module Bulma
  module Elements
    module Button
      # Creates a mailto link tag to the specified `email_address`, which is also used as the `name` of the link unless `name` is specified. Additional HTML attributes for the link can be passed in `html_attributes`.
      #
      # {Bulma::Elements::Button::MailComponent#initialize} has several methods for customizing the email itself by passing special keys to `html_attributes`.
      #
      # @see https://apidock.com/rails/ActionView/Helpers/UrlHelper/mail_to Ruby on Rails `mail_to` documentation
      class MailComponent < BaseComponent
        def initialize(email_address = nil, name = nil, **html_attributes)
          @email_address = email_address
          @name = name

          super(**html_attributes)
        end

        def call
          html_options = root_attributes(:base, **variants)

          if content?
            html_options = @name.merge(html_options) if @name.is_a?(Hash)
            return mail_to(@email_address, html_options) { content }
          end

          mail_to(@email_address, @name, html_options)
        end
      end
    end
  end
end
