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
            footer.button_to "It's form tag", "https://rubyonrails.org"
            footer.link_to "Ruby on Rails", "https://rubyonrails.org"
            footer.sms_to("123456789") { "Sms me" }
            footer.phone_to "123456789", "Phone me"
            footer.mail_to "example@example.com", "Mail me"
            footer.item(tag: :span) { "Just a text" }
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
        assert_selector(
          ".card>.card-footer>form[action='https://rubyonrails.org'][method='post'].button_to>button[type='submit']", text: "It's form tag", count: 1, visible: true, class: "card-footer-item"
        )
        assert_selector(
          ".card>.card-footer>a[href='https://rubyonrails.org']", text: "Ruby on Rails", count: 1, visible: true, class: "card-footer-item"
        )
        assert_selector(".card>.card-footer>a[href='sms:123456789;']", text: "Sms me", count: 1, visible: true, class: "card-footer-item")
        assert_selector(".card>.card-footer>a[href='tel:123456789']", text: "Phone me", count: 1, visible: true, class: "card-footer-item")
        assert_selector(
          ".card>.card-footer>a[href='mailto:example@example.com']", text: "Mail me", count: 1, visible: true, class: "card-footer-item"
        )
        assert_selector(
          ".card>.card-footer>span", text: "Just a text", count: 1, visible: true, class: "card-footer-item"
        )
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
