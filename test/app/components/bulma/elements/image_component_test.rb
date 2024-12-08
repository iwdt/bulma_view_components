require "test_helper"

module Bulma
  module Elements
    class ImageComponentTest < ViewComponents::TestCase
      def test_render_component
        component = ImageComponent.new
        render_inline(component)
        assert_component_rendered
        assert_selector("figure", count: 1, visible: true, class: "image")
      end

      def test_render_component_with_content
        component = ImageComponent.new
        render_inline(component) { "Image" }
        assert_component_rendered
        assert_selector("figure", count: 1, text: "Image", visible: true, class: "image")
      end

      def test_dimension_variant
        [16, 24, 32, 48, 64, 96, 128].each do |dimension|
          component = ImageComponent.new(dimension: dimension)
          render_inline(component)
          assert_component_rendered
          assert_selector("figure", count: 1, visible: true, class: ["image", "is-#{dimension}x#{dimension}"])
        end
      end

      def test_ratio_variant
        {
          square: "is-square",
          "1_by_1": "is-1by1",
          "5_by_4": "is-5by4",
          "4_by_3": "is-4by3",
          "3_by_2": "is-3by2",
          "5_by_3": "is-5by3",
          "16_by_9": "is-16by9",
          "2_by_1": "is-2by1",
          "3_by_1": "is-3by1",
          "4_by_5": "is-4by5",
          "3_by_4": "is-3by4",
          "2_by_3": "is-2by3",
          "3_by_5": "is-3by5",
          "9_by_16": "is-9by16",
          "1_by_2": "is-1by2",
          "1_by_3": "is-1by3"
        }.each do |ratio, class_name|
          component = ImageComponent.new(ratio: ratio)
          render_inline(component)
          assert_component_rendered
          assert_selector("figure", count: 1, visible: true, class: ["image", class_name])
        end
      end
    end
  end
end
