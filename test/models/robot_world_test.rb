require_relative "../test_helper"
require 'pry'

class RobotWorldTest < Minitest::Test
  include TestHelpers


  def test_it_creates_a_robot
    create_robots(1)

    robot = robot_world.all.last

    assert_equal "name 1", robot.name
    assert_equal "city 1", robot.city
    assert_equal "state 1", robot.state
    assert_equal "avatar 1", robot.avatar
    assert_equal "birthdate 1", robot.birthdate
    assert_equal "date hired 1", robot.date_hired
    assert_equal "department 1", robot.department
  end

  def test_all_returns_array_robots
    create_robots(3)

    all_robots = robot_world.all

    assert_equal Array, all_robots.class
    assert_equal 3, all_robots.size
    assert_equal "name 1", all_robots.first.name
    assert_equal "name 3", all_robots.last.name
  end

  def test_find_returns_matching_robot_object
    create_robots(5)
    robot_1 = robot_world.find(robot_world.all.first.id)
    robot_5 = robot_world.find(robot_world.all.last.id)

    assert_equal "name 1", robot_1.name
    assert_equal "name 5", robot_5.name

  end

  def test_update_changes_existing_robot
    create_robots(1)

    first_id = robot_world.all.first.id
    robot = robot_world.find(first_id)

    assert_equal "name 1", robot.name

    updated_robot = {name: "name ! 1"}

    robot_world.update(first_id, updated_robot)

    robot = robot_world.find(first_id)

    assert_equal "name ! 1", robot.name
  end

  def test_destroy_deletes_robot_from_database
    create_robots(1)

    first_id = robot_world.all.first.id
    all_robots = robot_world.all

    assert_equal 1 , all_robots.count

    robot_world.destroy(first_id)
    all_robots = robot_world.all

    assert_equal 0, all_robots.count  
  end

end
