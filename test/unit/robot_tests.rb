require_relative "../../models/robot"
require "test/unit"

class RobotTests < Test::Unit::TestCase
  def test_initialization
    robot = Robot.new
    
    assert_not_nil(!robot.is_initialized?)
  end

  def test_placement_with_valid_input
    robot = Robot.new
    robot.place(0, 0, :north)
    
    assert_not_nil(robot.is_initialized?)
    assert_equal(robot.x, 0)
    assert_equal(robot.y, 0)
    assert_equal(robot.direction, :north)
  end
  
  def test_placement_with_invalid_position
    robot = Robot.new
    
    robot.place(0, -1, :north)
    assert_not_nil(!robot.is_initialized?)

    robot.place(-1, 0, :north)
    assert_not_nil(!robot.is_initialized?)

    robot.place(5, 0, :north)
    assert_not_nil(!robot.is_initialized?)

    robot.place(5, 0, :north)
    assert_not_nil(!robot.is_initialized?)
  end

  def test_placement_with_all_valid_positions
    robot = Robot.new

    0.upto(4) do |x|
      0.upto(4) do |y|
        robot.place(x, y, :north)
        assert_not_nil(robot.is_initialized?)
      end
    end
  end
end
