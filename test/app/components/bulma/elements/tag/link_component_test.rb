require "test_helper"

module Bulma
  module Elements
    module Tag
      class LinkComponentTest < ViewComponents::TestCase
        def test_render_component
          component = LinkComponent.new("Ruby on Rails", "https://rubyonrails.org")
          render_inline(component)

          assert_component_rendered
          assert_selector(
            "a[href='https://rubyonrails.org']",
            text: "Ruby on Rails",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_component_with_content
          component = LinkComponent.new("https://rubyonrails.org", {data: {controller: "test_controller"}})
          render_inline(component) { "Ruby on Rails" }

          assert_component_rendered
          assert_selector(
            "a[href='https://rubyonrails.org'][data-controller='test_controller']",
            text: "Ruby on Rails",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_componenet_only_first_param
          with_request_url "/products/10" do
            component = LinkComponent.new("Product #10")
            render_inline(component)
            assert_component_rendered
            assert_selector(
              "a[href='/products/10']",
              text: "Product #10",
              count: 1,
              visible: true,
              class: "tag"
            )
          end
        end

        def test_render_componenet_only_first_param_with_content
          component = LinkComponent.new("https://rubyonrails.org/")
          render_inline(component) { "Ruby on Rails" }
          assert_component_rendered
          assert_selector(
            "a[href='https://rubyonrails.org/']",
            text: "Ruby on Rails",
            count: 1,
            visible: true,
            class: "tag"
          )
        end

        def test_render_componenet_only_second_param
          component = LinkComponent.new(nil, "https://rubyonrails.org")
          render_inline(component)
          assert_component_rendered
          assert_selector(
            "a[href='https://rubyonrails.org']",
            text: "https://rubyonrails.org",
            count: 1,
            visible: true,
            class: "tag"
          )
        end
      end
    end
  end
end
