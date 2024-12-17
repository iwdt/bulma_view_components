require "test_helper"

module Bulma
  module Components
    class ModalComponentTest < ViewComponents::TestCase
      def test_render_component
        component = ModalComponent.new(data: {controller: "modal"})
        render_inline(component) do |modal|
          modal.overlay data: {action: "click->modal#close"}
          modal.close data: {action: "click->modal#close"}, aria: {label: "close"}

          render Elements::BoxComponent.new.with_content(content_text)
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "modal")
        assert_selector(".modal>div", count: 1, visible: true, class: "modal-background")
        assert_selector(".modal>button", count: 1, visible: true, class: ["modal-close", "is-large"])
        assert_selector(".modal>div", count: 1, visible: true, class: "modal-content")
        assert_selector(".modal>.modal-content>div", text: content_text, count: 1, visible: true, class: "box")
      end

      def test_render_modal_content
        component = ModalComponent.new(data: {controller: "modal"})
        render_inline(component) do |modal|
          modal.overlay data: {action: "click->modal#close"}
          modal.close data: {action: "click->modal#close"}, aria: {label: "close"}
          modal.body { render Elements::BoxComponent.new.with_content(content_text) }
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "modal")
        assert_selector(".modal>div", count: 1, visible: true, class: "modal-background")
        assert_selector(".modal>button", count: 1, visible: true, class: ["modal-close", "is-large"])
        assert_selector(".modal>div", count: 1, visible: true, class: "modal-content")
        assert_selector(".modal>.modal-content>div", text: content_text, count: 1, visible: true, class: "box")
      end

      def test_render_modal_image
        component = ModalComponent.new(data: {controller: "modal"})
        render_inline(component) do |modal|
          modal.overlay data: {action: "click->modal#close"}
          modal.close data: {action: "click->modal#close"}, aria: {label: "close"}

          render Elements::ImageComponent.new tag: :p, ratio: "4_by_3" do
            image_tag "https://bulma.io/assets/images/placeholders/1280x960.png", alt: "Image tag"
          end
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "modal")
        assert_selector(".modal>div", count: 1, visible: true, class: "modal-background")
        assert_selector(".modal>button", count: 1, visible: true, class: ["modal-close", "is-large"])
        assert_selector(".modal>div", count: 1, visible: true, class: "modal-content")
        assert_selector(".modal>.modal-content>p", count: 1, visible: true, class: ["image", "is-4by3"])
      end

      def test_render_modal_card
        component = ModalComponent.new(data: {controller: "modal"})
        render_inline(component) do |modal|
          modal.overlay data: {action: "click->modal#close"}
          modal.card do |card|
            card.header do |header|
              header.title "Modal title"
              render Elements::DeleteComponent.new aria: {label: "close"}, data: {action: "click->modal#close"}
            end

            card.footer do
              render Elements::ButtonsComponent.new do |buttons|
                buttons.button_tag "Save changes", color: :success
                buttons.button_tag "Cancel"
              end
            end

            render Elements::ContentComponent.new.with_content(content_text)
          end
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "modal")
        assert_selector(".modal>div", count: 1, visible: true, class: "modal-background")

        assert_selector(".modal>div", count: 1, visible: true, class: "modal-card")
        # Header
        assert_selector(".modal>.modal-card>header", count: 1, visible: true, class: "modal-card-head")
        assert_selector(".modal>.modal-card>.modal-card-head>p", count: 1, visible: true, class: "modal-card-title")
        assert_selector(".modal>.modal-card>.modal-card-head>p+button", count: 1, visible: true, class: "delete")
        # Body
        assert_selector(".modal>.modal-card>section", count: 1, visible: true, class: "modal-card-body")
        assert_selector(".modal>.modal-card>.modal-card-body>div", count: 1, visible: true, class: "content")
        # Footer
        assert_selector(".modal>.modal-card>footer", count: 1, visible: true, class: "modal-card-foot")
        assert_selector(".modal>.modal-card>.modal-card-foot>div", count: 1, visible: true, class: "buttons")
        assert_selector(".modal>.modal-card>.modal-card-foot>.buttons>button", text: "Save changes", count: 1, visible: true, class: ["button", "is-success"])
        assert_selector(".modal>.modal-card>.modal-card-foot>.buttons>button", text: "Cancel", count: 1, visible: true, class: "button")
      end

      def test_render_modal_card_with_body
        component = ModalComponent.new(data: {controller: "modal"})
        render_inline(component) do |modal|
          modal.overlay data: {action: "click->modal#close"}
          modal.card do |card|
            card.header do |header|
              header.title "Modal title"
              render Elements::DeleteComponent.new aria: {label: "close"}, data: {action: "click->modal#close"}
            end
            card.body do
              render Elements::ContentComponent.new.with_content(content_text)
            end
            card.footer do
              render Elements::ButtonsComponent.new do |buttons|
                buttons.button_tag "Save changes", color: :success
                buttons.button_tag "Cancel"
              end
            end
          end
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "modal")
        assert_selector(".modal>div", count: 1, visible: true, class: "modal-background")

        assert_selector(".modal>div", count: 1, visible: true, class: "modal-card")
        # Header
        assert_selector(".modal>.modal-card>header", count: 1, visible: true, class: "modal-card-head")
        assert_selector(".modal>.modal-card>.modal-card-head>p", count: 1, visible: true, class: "modal-card-title")
        assert_selector(".modal>.modal-card>.modal-card-head>p+button", count: 1, visible: true, class: "delete")
        # Body
        assert_selector(".modal>.modal-card>section", count: 1, visible: true, class: "modal-card-body")
        assert_selector(".modal>.modal-card>.modal-card-body>div", count: 1, visible: true, class: "content")
        # Footer
        assert_selector(".modal>.modal-card>footer", count: 1, visible: true, class: "modal-card-foot")
        assert_selector(".modal>.modal-card>.modal-card-foot>div", count: 1, visible: true, class: "buttons")
        assert_selector(".modal>.modal-card>.modal-card-foot>.buttons>button", text: "Save changes", count: 1, visible: true, class: ["button", "is-success"])
        assert_selector(".modal>.modal-card>.modal-card-foot>.buttons>button", text: "Cancel", count: 1, visible: true, class: "button")
      end

      private

      def content_text
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur sit amet massa fringilla egestas. Nullam condimentum luctus turpis."
      end
    end
  end
end
