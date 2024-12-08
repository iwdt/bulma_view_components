require "test_helper"

module Bulma
  module Elements
    module Tag
      class FormComponentTest < ViewComponents::TestCase
        def test_render_component
          component = FormComponent.new("Ruby on Rails", "https://rubyonrails.org")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "form.tag[action='https://rubyonrails.org'][method='post']>button[type='submit']",
            text: "Ruby on Rails",
            count: 1,
            visible: true
          )
        end

        def test_render_component_with_content
          component = FormComponent.new("https://rubyonrails.org")
          render_inline(component) { "Ruby on Rails" }
          assert_component_rendered
          assert_selector(
            "form.tag[action='https://rubyonrails.org'][method='post']>button[type='submit']",
            text: "Ruby on Rails",
            count: 1,
            visible: true
          )
        end

        def test_render_component_with_context_and_options
          component = FormComponent.new("https://rubyonrails.org", {data: {controller: "test_controller"}})
          render_inline(component) { "Ruby on Rails" }
          assert_component_rendered
          assert_selector(
            "form.tag[action='https://rubyonrails.org'][method='post']>button[type='submit'][data-controller='test_controller']",
            text: "Ruby on Rails",
            count: 1,
            visible: true
          )
        end

        def test_render_component_without_args
          with_request_url "/products/10" do
            component = FormComponent.new
            render_inline(component) { "Ruby on Rails" }
            assert_component_rendered
            assert_selector(
              "form.tag[action='/products/10'][method='post']>button[type='submit']",
              text: "Ruby on Rails",
              count: 1,
              visible: true
            )
          end
        end

        def test_render_without_args_and_content
          with_request_url "/products/10" do
            component = FormComponent.new
            render_inline(component)
            assert_component_rendered
            assert_selector(
              "form.tag[action='/products/10'][method='post']>button[type='submit']",
              text: "/products/10",
              count: 1,
              visible: true
            )
          end
        end
      end
    end
  end
end
