# frozen_string_literal: true

require "test_helper"

module Bulma
  module ViewComponents
    class VersionTest < ::Minitest::Test
      def test_version_exists
        refute_nil VERSION
        assert_kind_of String, VERSION
      end
    end
  end
end
