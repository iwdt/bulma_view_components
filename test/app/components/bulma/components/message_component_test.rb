require "test_helper"

module Bulma
  module Components
    class MessageComponentTest < ViewComponents::TestCase
      def test_render_component
        component = MessageComponent.new
        render_inline(component) do |message|
          message.header do
            safe_join([
              tag.p("Hello world"),
              render(Elements::DeleteComponent.new(aria: {label: "delete"}))
            ])
          end

          <<~HTML.html_safe
            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            <strong>Pellentesque risus mi</strong>, tempus quis placerat ut, porta nec
            nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus
            diam, et dictum <a>felis venenatis</a> efficitur. Aenean ac
            <em>eleifend lacus</em>, in mollis lectus. Donec sodales, arcu et
            sollicitudin porttitor, tortor urna tempor ligula, id porttitor mi magna a
            neque. Donec dui urna, vehicula et sem eget, facilisis sodales sem.
          HTML
        end
        assert_component_rendered
        assert_selector("article", count: 1, visible: true, class: "message")
        assert_selector(".message>div", count: 1, visible: true, class: "message-header")
        assert_selector(".message>div", count: 1, visible: true, class: "message-body")
      end

      def test_without_content
        component = MessageComponent.new
        render_inline(component) do |message|
          message.header do
            safe_join([
              tag.p("Hello world"),
              render(Elements::DeleteComponent.new(aria: {label: "delete"}))
            ])
          end
        end
        assert_component_rendered
      end

      def test_render_without_header
        component = MessageComponent.new
        render_inline(component) do |message|
          tag.strong "Some content"
        end
        assert_component_rendered
      end

      def test_color_variants
        %i[dark link primary info success warning danger].each do |color|
          component = MessageComponent.new(color: color).with_content("Some content")
          render_inline(component)
          assert_component_rendered
          assert_selector("article.message", count: 1, visible: true, class: "is-#{color}")
        end
      end

      def test_size_variants
        %i[small normal medium large].each do |size|
          component = MessageComponent.new(size: size).with_content("Some content")
          render_inline(component)
          assert_component_rendered
          assert_selector("article.message", count: 1, visible: true, class: "is-#{size}")
        end
      end
    end
  end
end
