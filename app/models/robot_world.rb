require 'yaml/store'
require 'sequel'

class RobotWorld
  def self.database
    if ENV['ROBOT_WORLD_ENV'] == 'test'
      @database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world.sqlite3")
    end
  end

  def self.create_table
    database.create_table :robots do
      primary_key :id
      String      :name
      String      :city
      String      :state
      String      :avatar
      String      :birthdate
      String      :date_hired
      String      :department
    end
  end

  def self.create(robot)
    @robots = dataset
    id = @robots.insert({ "name" => robot[:name],
                        "city" => robot[:city],
                       "state" => robot[:state],
                      "avatar" => robot[:avatar],
                   "birthdate" => robot[:birthdate],
                  "date_hired" => robot[:date_hired],
                  "department" => robot[:department]})
    find(id)
  end

  def self.raw_robot(id)
    raw_robot.find {|robot| robot["id"] == id }
  end

  def self.find(id)
    raw_robot = database.from(:robots).where(id: id).first
    Robot.new(raw_robot)
  end

  def self.all
    raw_robot = database.from(:robots).all
    raw_robot.map {|data| Robot.new(data)}
  end

  def self.delete_all
    dataset.delete
    database
  end

  def self.dataset
    database.from(:robots)
  end

  private_class_method :dataset


end
