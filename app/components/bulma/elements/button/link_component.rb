module Bulma
  module Elements
    module Button
      # Creates an anchor element of the given `name` using a URL created by the set of `options`.
      # See the valid options in the documentation for {#url_for}. It’s also possible to pass a {String} instead of an
      # options hash, which generates an anchor element that uses the value of the {String} as the href for the link.
      # Using a `:back` {Symbol} instead of an options hash will generate a link to the referrer (a JavaScript back
      # link will be used in place of a referrer if none exists).
      # If `nil` is passed as the name the value of the link itself will become the name.
      #
      # @see https://apidock.com/rails/ActionView/Helpers/UrlHelper/link_to Ruby on Rails `link_to` documentation
      class LinkComponent < BaseComponent
        def initialize(name = nil, options = nil, **html_attributes)
          @name = name
          @options = options

          super(**html_attributes)
        end

        def call
          html_options = root_attributes(:base, **variants)

          if content?
            html_options = @options.merge(html_options) if @options.is_a?(Hash)
            return link_to(@name, html_options) { content }
          end

          link_to(@name, @options, html_options)
        end
      end
    end
  end
end
