require "test_helper"

module Bulma
  module Elements
    module Button
      class FormComponentTest < ViewComponents::TestCase
        def test_render_component
          component = FormComponent.new("Ruby on Rails", "https://rubyonrails.org")
          render_inline(component)

          assert_component_rendered
          assert_selector(
            "form[method='post'][action='https://rubyonrails.org']",
            count: 1,
            visible: true,
            class: "button_to"
          )
          assert_selector(
            "button[type='submit']",
            text: "Ruby on Rails",
            count: 1,
            visible: true,
            class: "button"
          )
        end

        def test_render_component_with_content
          component = FormComponent.new("https://rubyonrails.org", {data: {controller: "test_controller"}})
          render_inline(component) { "Ruby on Rails" }

          assert_component_rendered
          assert_selector(
            "form[method='post'][action='https://rubyonrails.org']",
            count: 1,
            visible: true,
            class: "button_to"
          )
          assert_selector(
            "button[type='submit'][data-controller='test_controller']",
            text: "Ruby on Rails",
            count: 1,
            visible: true,
            class: "button"
          )
        end

        def test_render_componenet_only_first_param
          with_request_url "/products/10" do
            component = FormComponent.new("Product #10")
            render_inline(component)
            assert_component_rendered
            assert_selector(
              "form[method='post'][action='/products/10']",
              count: 1,
              visible: true,
              class: "button_to"
            )
            assert_selector(
              "button[type='submit']",
              text: "Product #10",
              count: 1,
              visible: true,
              class: "button"
            )
          end
        end

        def test_render_componenet_only_first_param_with_content
          component = FormComponent.new("https://rubyonrails.org/")
          render_inline(component) { "Ruby on Rails" }
          assert_component_rendered
          assert_selector(
            "form[method='post'][action='https://rubyonrails.org/']",
            count: 1,
            visible: true,
            class: "button_to"
          )
          assert_selector(
            "button[type='submit']",
            text: "Ruby on Rails",
            count: 1,
            visible: true,
            class: "button"
          )
        end

        def test_render_componenet_only_second_param
          component = FormComponent.new(nil, "https://rubyonrails.org")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "form[method='post'][action='https://rubyonrails.org']",
            count: 1,
            visible: true,
            class: "button_to"
          )
          assert_selector(
            "button[type='submit']",
            text: "https://rubyonrails.org",
            count: 1,
            visible: true,
            class: "button"
          )
        end
      end
    end
  end
end
