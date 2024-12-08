require "test_helper"

module Bulma
  module Components
    class CardComponentTest < ViewComponents::TestCase
      def test_render_component
        component = CardComponent.new
        render_inline(component) do |card|
          card.image do
            render Elements::ImageComponent.new(ratio: "4_by_3") do
              tag.img src: "https://bulma.io/assets/images/placeholders/1280x960.png",
                alt: "Placeholder image"
            end
          end
          card.header do |header|
            header.title("Card header")
            header.icon(aria: {label: "more options"}) do
              render Elements::IconComponent.new do
                tag.i class: %w[fas fa-angle-down], aria: {hidden: true}
              end
            end
          end
          card.body do
            render Elements::ContentComponent.new do
              <<~TEXT
                Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros. Donec
                id elit non mi porta gravida at eget metus. Cum sociis natoque penatibus
                et magnis dis parturient montes, nascetur ridiculus mus. Cras mattis
                consectetur purus sit amet fermentum.
              TEXT
            end
          end
          card.footer do |footer|
            footer.item(tag: :a, href: "#") { "Save" }
            footer.item(tag: :a, href: "#") { "Edit" }
            footer.item(tag: :a, href: "#") { "Delete" }
          end
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "card")
        assert_selector(".card>div", count: 1, visible: true, class: "card-image")
        assert_selector(".card>header", count: 1, visible: true, class: "card-header")
        assert_selector(".card>.card-header>p", text: "Card header", count: 1, visible: true, class: "card-header-title")
        assert_selector(".card>.card-header>button", count: 1, visible: true, class: "card-header-icon")
        assert_selector(".card>div", count: 1, visible: true, class: "card-content")
        assert_selector(".card>footer", count: 1, visible: true, class: "card-footer")
        assert_selector(".card>.card-footer>a", text: "Save", count: 1, visible: true, class: "card-footer-item")
        assert_selector(".card>.card-footer>a", text: "Edit", count: 1, visible: true, class: "card-footer-item")
        assert_selector(".card>.card-footer>a", text: "Delete", count: 1, visible: true, class: "card-footer-item")
      end

      def test_render_without_body
        component = CardComponent.new
        render_inline(component) do |card|
          render Elements::ContentComponent.new do
            <<~TEXT
              Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros. Donec
              id elit non mi porta gravida at eget metus. Cum sociis natoque penatibus
              et magnis dis parturient montes, nascetur ridiculus mus. Cras mattis
              consectetur purus sit amet fermentum.
            TEXT
          end
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "card")
        assert_selector(".card>div", count: 1, visible: true, class: "card-content")
      end
    end
  end
end
