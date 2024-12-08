# frozen_string_literal: true

require_relative "lib/bulma/view_components/version"

Gem::Specification.new do |spec|
  spec.name = "bulma_view_components"
  spec.version = Bulma::ViewComponents::VERSION
  spec.authors = [""]
  spec.email = [""]

  spec.summary = ""
  spec.description = ""
  spec.homepage = ""
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.1.0")

  spec.metadata["allowed_push_host"] = ""

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = ""
  # spec.metadata["changelog_uri"] = ""

  spec.files = Dir[
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md",
    "lib/**/*.rb",
    "sig/**/*.rbs"
  ]

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "view_component"
  spec.add_dependency "view_component-contrib"
  spec.add_dependency "actionview", ">= 7.0.0"
end
