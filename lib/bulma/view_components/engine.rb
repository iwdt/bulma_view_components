module Bulma
  module ViewComponents
    class Engine < ::Rails::Engine
      # steep:ignore:start
      isolate_namespace Bulma::ViewComponents

      config.autoload_paths = %W[
        #{root}/lib
      ]

      config.eager_load_paths = %W[
        #{root}/app/components
        #{root}/app/previews
        #{root}/app/helpers
      ]

      config.bulma_view_components = ActiveSupport::OrderedOptions.new
      # steep:ignore:end
    end
  end
end
