require "test_helper"

module Bulma
  module Elements
    class TagsComponentTest < ViewComponents::TestCase
      def test_render_component
        component = TagsComponent.new
        render_inline(component)
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "tags")
      end

      def test_render_component_with_content
        component = TagsComponent.new
        render_inline(component) { "Test text" }
        assert_component_rendered
        assert_selector("div", text: "Test text", count: 1, visible: true, class: "tags")
      end

      def test_render_component_with_slots
        component = TagsComponent.new
        render_inline(component) do |tags|
          tags.tag "Tag"
          tags.button_to "It's form tag", "https://rubyonrails.org"
          tags.link_to "Ruby on Rails", "https://rubyonrails.org"
          tags.mail_to "example@example.com", "Mail me"
          tags.phone_to "1234567", "Phone me"
          tags.sms_to "1234567", "Sms me"
        end
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: "tags")
        assert_selector(".tags>span", text: "Tag", count: 1, visible: true, class: "tag")
        assert_selector(".tags>form.tag[action='https://rubyonrails.org'][method='post']>button[type='submit']", text: "It's form tag", count: 1, visible: true)
        assert_selector(".tags>a[href='https://rubyonrails.org']", text: "Ruby on Rails", count: 1, visible: true, class: "tag")
        assert_selector(".tags>a[href='mailto:example@example.com']", text: "Mail me", count: 1, visible: true, class: "tag")
        assert_selector(".tags>a[href='tel:1234567']", text: "Phone me", count: 1, visible: true, class: "tag")
        assert_selector(".tags>a[href='sms:1234567;']", text: "Sms me", count: 1, visible: true, class: "tag")
      end

      def test_addons_variant
        component = TagsComponent.new(addons: true)
        render_inline(component)
        assert_component_rendered
        assert_selector("div", count: 1, visible: true, class: ["tags", "has-addons"])
      end
    end
  end
end
