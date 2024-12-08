module Bulma
  module Elements
    # You can combine an icon with text, using the icon-text wrapper, as long as all text inside is wrapped in its own span element:
    #
    # @see https://bulma.io/documentation/elements/icon/#icon-text Bulma's documentation
    class IconTextComponent < ApplicationComponent
      self.root_tag = :div

      style do
        base { "icon-text" }
      end
    end
  end
end
