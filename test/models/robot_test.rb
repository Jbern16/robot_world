require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    robot = Robot.new({ :name       => "name",
                        :city       => 'city',
                        :state      => 'state',
                        :avatar     => 'avatar',
                        :birthdate  => 'birthdate',
                        :date_hired => 'date hired',
                        :department => 'department',
                        :id         => 1 })

    assert_equal "name", robot.name
    assert_equal "city", robot.city
    assert_equal 'state', robot.state
    assert_equal 'avatar', robot.avatar
    assert_equal 'birthdate', robot.birthdate
    assert_equal 'date hired', robot.date_hired
    assert_equal 'department', robot.department
    assert_equal 1, robot.id
  end

end
