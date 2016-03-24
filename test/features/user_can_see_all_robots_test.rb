require_relative '../test_helper'

class UserCreatesTask < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_sees_all_robots_listed_when_see_robots_is_pressed
    visit '/'

    click_link("See Robots")

    assert_equal "/robots", current_path
  end
end
