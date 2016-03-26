
class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.from(:robots).insert(robot)
  end


  def update(id, robot)
    database.from(:robots).where(id: id).update(robot)
  end


  def all
    raw_robots = database.from(:robots).select.to_a
    raw_robots.map { |data| Robot.new(data) }
  end

  def find(id)
    raw_robot = database.from(:robots).where(id: id).to_a.first
    Robot.new(raw_robot)
  end


  def destroy(id)
    database.from(:robots).where(id: id).delete
  end

  def delete_all
    database.from(:robots).delete
  end

  def organize_by(location)
    locations = all.map(&location)
    locations.each_with_object(Hash.new(0)) do |place, counter|
      counter[place] += 1
    end
  end

end
