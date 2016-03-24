require_relative "../test_helper"

class UserCanDelete < Minitest::Test
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

  def test_when_user_deletes_robot_that_robot_is_deleted_from_the_database
      visit '/robots'

      click_button("Delete")
      assert_equal "/robots", current_path

      within "#robots" do
        refute page.has_content?("test")
      end
  end
end
