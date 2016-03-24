require_relative '../test_helper'

class UserCreatesTask < Minitest::Test
  include TestHelpers
  include Capybara::DSL


def setup
  visit '/'

  click_link("Create Robot")
  assert_equal "/robots/new", current_path

  fill_in('robot[name]', with: 'test')
  fill_in('robot[city]', with: 'test')
  fill_in('robot[state]', with: 'test')
  fill_in('robot[avatar]', with: 'test')
  fill_in('robot[date_hired]', with: 'test')
  fill_in('robot[department]', with: 'test')
  click_button ("Create Robot!")
end

def test_when_user_edits_a_robot_the_robot_is_edited
  visit '/robots'

  click_link("Edit")
  assert_equal "/robots/test/edit", current_path

  fill_in('robot[state]', with: "CO")

  click_button("Save")
  assert_equal "/robots/test", current_path
  within "#test" do
    assert page.has_content?("CO")
  end
end

end
