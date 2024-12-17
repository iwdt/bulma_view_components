module Bulma
  ##
  # # Base class for all bulma's components.
  #
  # All Bulma ViewComponents accept a standard set of options called root attributes.
  # Under the hood, root attributes are mapped to bulma classes, with any remaining options passed to Rails' [`content_tag`](https://api.rubyonrails.org/classes/ActionView/Helpers/TagHelper.html#method-i-content_tag).
  #
  # @abstract Inherit and implement component logic
  #
  # @see https://bulma.io/ Bulma documentation
  # @see https://viewcomponent.org/ ViewComponent library documentation
  # @see https://github.com/palkan/view_component-contrib ViewComponent extenstion documentation
  #
  # @!method self.registered_slots
  #   Get list of registered slots at component
  #
  #   @see ViewComponent::Slotable
  #   @return [Hash<Symbol, Hash<Symbol, Object>>] list of registered slots
  #
  # @!method self.style(name = nil, &block)
  #   Define styles for component
  #
  #   @api private
  #   @param name [Symbol] the name of style
  #   @return [void]
  #   @see https://github.com/palkan/view_component-contrib?tab=readme-ov-file#style-variants Style variants documentation
  #
  # @!method with_content(value)
  #   Pass a string content to component
  #
  #   @param value [String] the component content
  #   @raise [ViewComponent::NilWithContentError] when no content provided to {#wth_content}
  #   @return [self] the component instance with content
  #   @see ViewComponent::WithContentHelper#with_content
  #
  # @!method style(name = nil, **variants)
  #   Compile component's class names
  #
  #   @api private
  #   @param name [Symbol] the name of style
  #   @param variants [Hash<Symbol, Symbol>, Hash<Symbol, Boolean>] style variants
  #   @return [String] CSS class names
  #   @see https://github.com/palkan/view_component-contrib?tab=readme-ov-file#style-variants Style variants documentation
  #
  # @example Basic usage
  #   <%= render Bulma::ApplicationComponent.new.with_content("Content") %>
  #   #=> <div>Content</div>
  #
  # @since 0.1.0
  class ApplicationComponent < ViewComponentContrib::Base
    include ViewComponentContrib::StyleVariants

    # @dynamic root_tag
    # @!attribute self.root_tag
    #   @return [Symbol] the default root HTML element tag for component. (default: `:div`)
    class_attribute :root_tag,
      instance_accessor: false,
      instance_reader: false,
      instance_writer: false,
      instance_predicate: false,
      default: :div

    class << self
      # @return [String] component name
      def component_name
        @component_name ||= name.sub("Component", "").underscore.split("/").join("--")
      end
    end

    ##
    # Initialize a new component
    #
    # ## HTML attributes
    # Use system arguments to add HTML attributes to elements. For the most part, system arguments map 1:1 to
    # HTML attributes. For example,
    # ```erb
    # <%= render Bulma::ApplicationComponent.new title: "Foo" %>
    # ```
    # will result in eg.
    # ```html
    # <div title="foo"></div>
    # ```
    # However, ViewComponents applies special handling to certain system arguments. See the table below for details.
    #
    # | Name   | Type   | Description                                                           |
    # | :-     | :-     | :-                                                                    |
    # | `aria` | `Hash` | Aria attributes: `aria: { label: "foo" }` renders `aria-label='foo'`. |
    # | `data` | `Hash` | Data attributes: `data: { foo: :bar }` renders `data-foo='bar'`.      |
    #
    # ## Utility classes
    #
    # ViewComponents provides a convenient way to add Bulma CSS utility classes to HTML elements. Use the shorthand
    # documented in the tables below instead of adding CSS classes directly.
    #
    # ### Modifiers
    # | Name  | Type                                            | Description                                                                   |
    # | :-    | :-                                              | :-                                                                            |
    # | `is`  | `#to_s`, `Hash<#to_s, Boolean>`, `Array<#to_s>` | `is` modifiers: `is: ["clearfix"]` renders `class="is-clearfix"`              |
    # | `has` | `#to_s`, `Hash<#to_s, Boolean>`, `Array<#to_s>` | `has` modifiers: `has: ["text-centered"]` renders `class="has-text-centered"` |
    # | `are` | `#to_s`, `Hash<#to_s, Boolean>`, `Array<#to_s>` | `are` modifiers: `are: ["small"]` renders `class="are-small"`                 |
    #
    # ### Other
    # | Name          | Type                                            | Description      |
    # | :-            | :-                                              | :-               |
    # | `class`       | `#to_s`, `Hash<#to_s, Boolean>`, `Array<#to_s>` | CSS class names. |
    #
    #
    # @param tag [#to_s] Root HTML element tag
    # @param html_attributes [Hash<Symbol, Object>] Root HTML element classes.
    # @option html_attributes [Array<#to_s>, Hash<#to_s, Boolean>, #to_s] :is Modifier's that apply to itself
    # @option html_attributes [Array<#to_s>, Hash<#to_s, Boolean>, #to_s] :has Modifier's that apply to itself and childs
    # @option html_attributes [Array<#to_s>, Hash<#to_s, Boolean>, #to_s] :are Modifier's that apply to childs
    # @option html_attributes [Array<#to_s>, Hash<#to_s, Boolean>, #to_s] :class CSS class names to apply on root element
    def initialize(tag: self.class.root_tag, **html_attributes)
      super

      @root_tag = tag
      @root_classes = html_attributes.delete(:class)
      @root_modifiers = html_attributes.extract!(:is, :has, :are)
      @root_attributes = html_attributes
    end

    # Render component to string
    #
    # @return [String] HTML markup
    def call
      content_tag(root_tag, content, **root_attributes)
    end

    private

    # @return [Symbol] root HTML element tag
    #
    # @see https://developer.mozilla.org/docs/Glossary/Tag Mozilla documentaion about tag
    attr_reader :root_tag

    # Root HTML element all attributes
    #
    # @param **style_names [Array<Symbol>] any style names for {#style}
    # @param **variants [Object] any options for {#style}
    #
    # @return [Hash<Symbol, Object>] root HTML element attributes with classes
    #
    # @see https://developer.mozilla.org/docs/Glossary/Attribute Mozilla documentaion about attributes
    def root_attributes(*style_names, **variants)
      @root_attributes.merge(
        class: root_style(*style_names, **variants).presence
      ).compact
    end

    # Build root element classes
    #
    # @param **style_options [Object] Any options for {#style}
    #
    # @return [Array] root element classes
    #
    # @see https://developer.mozilla.org/docs/Web/HTML/Global_attributes/class Mozilla documentaion about class attribute
    def root_style(*names, **variants)
      styles = [] # : Array[html_class]
      if names.any?
        names.each { styles << style(_1, **variants) }
      else
        styles << style(**variants)
      end
      styles << @root_classes if @root_classes.present?
      styles.concat(root_modifiers)
      styles
    end

    # @return [Array] CSS class names for modifiers
    def root_modifiers
      @root_modifiers.map do |prefix, modifier|
        modifier_class_for(modifier, prefix: prefix)
      end
    end

    # Prepare modifier's to bulma's syntax
    #
    # @param modifier [Object] Modfier name
    # @param prefix [String] Modifier prefix
    #
    # @return [Array<String>, String, Hash<String, Boolean>] HTML class names for modier
    def modifier_class_for(modifier, prefix: :is)
      case modifier
      when Array then modifier.map { |name| modifier_class_for(name, prefix: prefix) }
      when Hash then modifier.transform_keys { |name| modifier_class_for(name, prefix: prefix) }
      when String, Symbol, Numeric then "#{prefix}-#{modifier}"
      end
    end

    # @return [String] component name
    def component_name
      @component_name ||= self.class.name
    end

    # Setup CSS variable for inline `style` attribute
    #
    # @param name [#to_s] CSS variable name
    # @param value [#to_s] CSS variable value
    # @param attributes [Hash<Symbol, Object>] Attributes to setup variables
    #
    # @return [void]
    def inline_css_variable!(name, value, attributes)
      attributes[:style] = ["--#{name}: #{value};", attributes[:style]]
    end
  end
end
