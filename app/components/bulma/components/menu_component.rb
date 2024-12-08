module Bulma
  module Components
    class MenuComponent < ApplicationComponent
      self.root_tag = :aside

      # @dynamic menu_elements, with_menu_element_label, with_menu_element_list
      renders_many :menu_elements, types: {
        label: Menu::LabelComponent,
        list: Menu::ListComponent
      }

      style do
        base { "menu" }
      end

      def call
        content_tag(root_tag, safe_join([*menu_elements, content]), **root_attributes)
      end

      private :with_menu_element_label
      def label(text = nil, **html_attributes, &block)
        with_menu_element_label(text, **html_attributes, &block)
      end

      private :with_menu_element_list
      def list(**html_attributes, &block)
        with_menu_element_list(**html_attributes, &block)
      end
    end
  end
end
