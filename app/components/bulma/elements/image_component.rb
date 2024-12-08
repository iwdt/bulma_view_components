module Bulma
  module Elements
    # A container for responsive images
    #
    # @see https://bulma.io/documentation/elements/image/ Bulma's documentation
    class ImageComponent < ApplicationComponent
      self.root_tag = :figure

      style do
        base { "image" }

        variants do
          # steep:ignore:start
          dimension do
            dimension_16 { "is-16x16" }
            dimension_24 { "is-24x24" }
            dimension_32 { "is-32x32" }
            dimension_48 { "is-48x48" }
            dimension_64 { "is-64x64" }
            dimension_96 { "is-96x96" }
            dimension_128 { "is-128x128" }
          end

          ratio do
            ratio_square { "is-square" }
            ratio_1_by_1 { "is-1by1" }
            ratio_5_by_4 { "is-5by4" }
            ratio_4_by_3 { "is-4by3" }
            ratio_3_by_2 { "is-3by2" }
            ratio_5_by_3 { "is-5by3" }
            ratio_16_by_9 { "is-16by9" }
            ratio_2_by_1 { "is-2by1" }
            ratio_3_by_1 { "is-3by1" }
            ratio_4_by_5 { "is-4by5" }
            ratio_3_by_4 { "is-3by4" }
            ratio_2_by_3 { "is-2by3" }
            ratio_3_by_5 { "is-3by5" }
            ratio_9_by_16 { "is-9by16" }
            ratio_1_by_2 { "is-1by2" }
            ratio_1_by_3 { "is-1by3" }
          end
          # steep:ignore:end
        end
      end

      # @param dimension [String] image dimension. one of 16, 24, 32, 48, 64, 96 or 128
      # @param ratio [String] image ratio. one of "square", "1_by_1" "5_by_4", "4_by_3", "3_by_2", "5_by_3", "6_by_9", "2_by_1", "3_by_1", "4_by_5", "3_by_4", "2_by_3", "3_by_5", "9_by_16", "1_by_2", "1_by_3"
      # @param html_attributes [Hash<Symbol, Object>] Root HTML element attributes. see: {Bulma::ApplicationComponent#initialize}
      def initialize(dimension: nil, ratio: nil, **html_attributes)
        @dimension = :"dimension_#{dimension}" unless dimension.nil?
        @ratio = :"ratio_#{ratio}" unless ratio.nil?

        super(**html_attributes)
      end

      def call
        content_tag(root_tag, content, **root_attributes(ratio: @ratio, dimension: @dimension))
      end
    end
  end
end
