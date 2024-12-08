require "simplecov"

SimpleCov.start "rails" do
  enable_coverage :branch
  add_group "Components", "app/components"
end
