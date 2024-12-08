# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "coverage_helper" if ENV["COVERAGE"].to_s != "0"
require_relative "../test/dummy/config/environment"
require "bulma/view_components/test_case"
require "rails/test_help"
