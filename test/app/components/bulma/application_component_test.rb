require "test_helper"

module Bulma
  class ApplicationComponentTest < ViewComponents::TestCase
    def test_render_component
      component = Bulma::ApplicationComponent.new
      render_inline(component) { "Test text" }
      assert_component_rendered
      assert_selector(
        "div",
        count: 1,
        visible: true,
        text: "Test text"
      )
    end

    def test_render_component_with_html_attributes
      component = Bulma::ApplicationComponent.new(
        aria: {label: "Label"},
        data: {controller: :test_controller}
      )
      render_inline(component) { "Test text" }
      assert_component_rendered
      assert_selector(
        "div[aria-label='Label'][data-controller='test_controller']",
        count: 1,
        visible: true,
        text: "Test text"
      )
    end

    def test_render_component_with_nil_class_name
      component = Bulma::ApplicationComponent.new(class: nil)
      render_inline(component) { "Test text" }
      assert_component_rendered
      assert_selector(
        "div",
        count: 1,
        visible: true,
        text: "Test text"
      )
    end

    def test_render_component_with_class_names
      component = Bulma::ApplicationComponent.new(
        tag: :span,
        class: [:class_name0, {class_name1: true, class_name2: false}]
      )
      render_inline(component)
      assert_component_rendered
      assert_selector(
        "span",
        text: nil,
        count: 1,
        visible: true,
        class: %w[class_name0 class_name1]
      )
    end

    def test_render_component_with_modifiers
      component = Bulma::ApplicationComponent.new(
        tag: :span,
        is: ["m1", {m2: true, m3: false}],
        has: [:m4, {m5: false, m6: true}],
        are: [:m7, {m8: true, m9: false}]
      )
      render_inline(component)
      assert_component_rendered
      assert_selector(
        "span",
        text: nil,
        count: 1,
        visible: true,
        class: %w[is-m1 is-m2 has-m4 has-m6 are-m7 are-m8]
      )
    end

    def test_render_component_with_bad_modifiers
      component = Bulma::ApplicationComponent.new(is: Class.new)
      render_inline(component)
      assert_component_rendered
      assert_selector(
        "div",
        text: nil,
        count: 1,
        visible: true,
        class: []
      )
    end

    def test_component_name
      assert Bulma::ApplicationComponent.component_name == "bulma--application"
    end
  end
end
