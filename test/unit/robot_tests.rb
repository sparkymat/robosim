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

  def test_placement_twice
    robot = Robot.new

    robot.place(0, 0, :north)
    assert_not_nil(robot.is_initialized?)

    robot.place(2, 2, :east)
    assert_not_nil(robot.is_initialized?)

    assert_equal(robot.x, 2)
    assert_equal(robot.y, 2)
    assert_equal(robot.direction, :east)
  end
  
  def test_placement_with_invalid_location
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

  def test_placement_with_invalid_direction
    robot = Robot.new

    robot.place(0, 0, nil)
    assert_not_nil(!robot.is_initialized?)

    robot.place(0, 0, :northwest)
    assert_not_nil(!robot.is_initialized?)
  end

  def test_placement_with_all_valid_positions
    robot = Robot.new

    %i(north east south west).each do |direction|
      0.upto(4) do |x|
        0.upto(4) do |y|
          robot.place(x, y, direction)
          assert_not_nil(robot.is_initialized?)
        end
      end
    end
  end

  def test_move_without_initializing
    robot = Robot.new

    robot.move
    assert_not_nil(!robot.is_initialized?)
  end

  def test_move_properly
    robot = Robot.new

    robot.place(0, 0, :north)
    assert_not_nil(robot.is_initialized?)

    robot.move
    assert_equal(robot.x, 0)
    assert_equal(robot.y, 1)
    assert_equal(robot.direction, :north)
  end

  def test_turn_without_initializing
    robot = Robot.new

    robot.turn_left
    assert_not_nil(!robot.is_initialized?)

    robot.turn_right
    assert_not_nil(!robot.is_initialized?)
  end

  def test_turn_both_ways
    robot = Robot.new

    robot.place(0, 0, :north)
    assert_not_nil(robot.is_initialized?)

    robot.turn_left
    assert_equal(robot.x, 0)
    assert_equal(robot.y, 0)
    assert_equal(robot.direction, :west)

    robot.turn_right
    assert_equal(robot.x, 0)
    assert_equal(robot.y, 0)
    assert_equal(robot.direction, :north)
  end

  def test_move_and_turn
    robot = Robot.new

    robot.place(0, 0, :north)
    assert_not_nil(robot.is_initialized?)

    robot.move
    assert_equal(robot.x, 0)
    assert_equal(robot.y, 1)
    assert_equal(robot.direction, :north)

    robot.turn_right
    assert_equal(robot.x, 0)
    assert_equal(robot.y, 1)
    assert_equal(robot.direction, :east)

    robot.move
    assert_equal(robot.x, 1)
    assert_equal(robot.y, 1)
    assert_equal(robot.direction, :east)
  end

  def test_report_before_initializing
    robot = Robot.new

    assert_equal(robot.report, nil)
  end

  def test_report_after_initializing
    robot = Robot.new

    robot.place(0, 0, :north)
    assert_not_nil(robot.is_initialized?)
    
    reported_details = robot.report
    assert_not_nil(reported_details)
    assert_equal(reported_details[:x], robot.x)
    assert_equal(reported_details[:y], robot.y)
    assert_equal(reported_details[:direction], robot.direction)
  end
end
