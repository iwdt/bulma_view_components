module Bulma
  module Components
    module Dropdown
      module Menu
        class MailComponent < ItemComponent
          def initialize(email_address = nil, name = nil, **html_attributes)
            @email_address = email_address
            @name = name

            super(**html_attributes)
          end

          def call
            html_options = root_attributes(:item, active: @active)

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
end
