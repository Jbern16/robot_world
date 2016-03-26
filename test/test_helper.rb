ENV['RACK_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara/dsl'

module TestHelpers

Capybara.app = RobotWorldApp

  def teardown
    robot_world.delete_all
    super
  end

  def robot_world
    database = Sequel.sqlite("db/robot_world_test.sqlite")
    @robot_world ||= RobotWorld.new(database)
  end

  def create_robots(num)
    num.times do |i|
      robot_world.create({:name      => "name #{i+1}",
                          :city       => "city #{i+1}",
                          :state      => "state #{i+1}",
                          :avatar     => "avatar #{i+1}",
                          :birthdate  => "birthdate #{i+1}",
                          :date_hired => "date hired #{i+1}",
                          :department => "department #{i+1}"})
    end
  end
end
