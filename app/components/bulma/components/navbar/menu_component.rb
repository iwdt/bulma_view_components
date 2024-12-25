module Bulma
  module Components
    module Navbar
      class MenuComponent < ApplicationComponent
        # @dynamic navbar_left, with_navbar_left
        renders_one :navbar_left, Menu::LeftComponent
        # @dynamic navbar_right, with_navbar_right
        renders_one :navbar_right, Menu::RightComponent

        style do
          base { "navbar-menu" }

          variants do
            # steep:ignore:start
            active do
              yes { "is-active" }
            end
            # steep:ignore:end
          end
        end

        def initialize(active: false, **html_attributes)
          @active = active

          super(**html_attributes)
        end

        def call
          content_tag(root_tag, safe_join([navbar_left, navbar_right]), **root_attributes(active: @active))
        end

        private :with_navbar_left
        def left(**html_attributes, &block)
          with_navbar_left(**html_attributes, &block)
        end

        private :with_navbar_right
        def right(**html_attributes, &block)
          with_navbar_right(**html_attributes, &block)
        end
      end
    end
  end
end
