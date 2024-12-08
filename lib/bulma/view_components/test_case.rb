# steep:ignore:start
module Bulma
  module ViewComponents
    class TestCase < ViewComponent::TestCase
      include ActionView::TestCase::Behavior
    end
  end
end
# steep:ignore:end
