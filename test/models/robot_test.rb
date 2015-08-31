require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    attributes = {:name        => "adam",
                   :city       => "Denver",
                   :state      => "CO",
                   :avatar     => "yea",
                   :birthdate  => "8/4/85",
                   :date_hired => "7/6/15",
                   :department => "student"}

    robot = Robot.new(attributes)

    assert_equal "adam", robot.name
    assert_equal "Denver", robot.city
    assert_equal "CO", robot.state
    assert_equal "yea", robot.avatar
    assert_equal "8/4/85", robot.birthdate
    assert_equal "7/6/15", robot.date_hired
    assert_equal "student", robot.department
  end
end
