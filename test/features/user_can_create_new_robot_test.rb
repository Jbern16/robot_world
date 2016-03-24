require_relative '../test_helper'

class UserCreatesRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_is_shown_new_page_with_form_when_create_robot_is_cicked
    visit '/'

    click_link("Create Robot")
    assert_equal "/robots/new", current_path
  end

  def test_user_can_submit_all_information_and_see_there_new_robot
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

    assert_equal "/robots", current_path
    within "#robots" do
      assert page.has_content?("test")
    end

    visit '/robots/test'
    within "#test" do
      assert page.has_content?("test")
    end
  end

end
