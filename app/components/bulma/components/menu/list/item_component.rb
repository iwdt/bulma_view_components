module Bulma
  module Components
    module Menu
      module List
        class ItemComponent < ApplicationComponent
          self.root_tag = :li

          # @dynamic submenu, with_submenu
          renders_one :submenu, ListComponent

          def call
            content_tag(root_tag, safe_join([content, submenu]), **root_attributes)
          end

          private :with_submenu
          def list(**html_attributes, &block)
            with_submenu(**html_attributes, &block)
          end
        end
      end
    end
  end
end
