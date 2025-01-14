module Bulma
  module Components
    module Navbar
      module Item
        class PhoneComponent < ItemComponent
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
end
