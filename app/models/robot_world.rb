require 'yaml/store'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database['robots'] ||=[]
      database['robots'] << {"name" => robot[:name], "city" => robot[:city],
                            "state" => robot[:state], "avatar" => robot[:avatar],
                            "birthdate" => robot[:birthdate],
                            "date_hired" => robot[:birthdate],
                            "department" => robot[:department]}
    end
  end

  def update(name, robot)
    database.transaction do
      target = database['robots'].find {|data| data["name"] == name}
      target["city"] = robot[:city]
      target["state"] = robot[:state]
      target["avatar"] = robot[:avatar]
      target["birthdate"] = robot[:birthdate]
      target["date_hired"] = robot[:date_hired]
      target["department"] = robot[:department]
    end
  end

  def raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(name)
    raw_robots.find {|robot| robot["name"] == name}
  end

  def find(name)
    Robot.new(raw_robot(name))
  end


  def delete(name)
    database.transaction do
      database['robots'].delete_if { |robot| robot["name"] == name}
    end
  end

  def delete_all
    database.transaction do
      database['robots'] = []
    end
  end

  def oraganize_by(location)
    locations = all.map(&location)
    locations.each_with_object(Hash.new(0)) do |place, counter|
      counter[place] += 1
    end
  end


end
