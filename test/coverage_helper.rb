require "simplecov"

SimpleCov.start "rails" do
  enable_coverage :branch
  add_group "Components", "app/components"
  add_filter "lib/bulma/view_components/version.rb"
  add_filter "app/previews/"
end
