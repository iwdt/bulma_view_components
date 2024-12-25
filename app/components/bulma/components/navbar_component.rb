module Bulma
  module Components
    class NavbarComponent < ApplicationComponent
      self.root_tag = :nav

      style do
        base { "navbar" }

        variants do
          # steep:ignore:start
          transparent do
            yes { "is-transparent" }
          end

          fixed do
            yes { "is-fixed-top" }
            top { "is-fixed-top" }
            bottom { "is-fixed-bottom" }
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

          spaced do
            yes { "is-spaced" }
          end

          shadow do
            yes { "has-shadow" }
          end
          # steep:ignore:end
        end
      end

      # @dynamic with_navbar_brand, navbar_brand
      renders_one :navbar_brand, Navbar::BrandComponent

      # @dynamic with_navbar_menu, navbar_menu
      renders_one :navbar_menu, Navbar::MenuComponent

      def initialize(
        color: nil, transparent: false,
        fixed: false, spaced: false, shadow: false,
        **html_attributes
      )
        @transparent = transparent
        @fixed = fixed
        @color = color
        @spaced = spaced
        @shadow = shadow

        super(**html_attributes)
      end

      def call
        content_tag(
          root_tag,
          safe_join([navbar_brand, navbar_menu]),
          **root_attributes(
            transparent: @transparent,
            fixed: @fixed,
            color: @color,
            spaced: @spaced,
            shadow: @shadow
          )
        )
      end

      private :with_navbar_brand
      def brand(**html_attributes, &block)
        with_navbar_brand(**html_attributes, &block)
      end

      private :with_navbar_menu
      def menu(**html_attributes, &block)
        with_navbar_menu(**html_attributes, &block)
      end
    end
  end
end
