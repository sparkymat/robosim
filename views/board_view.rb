require_relative "../models/robot"

class BoardView
  def self.show_robot_on_board(robot)
    0.upto(Robot::BOARD_SIZE-1) do |y|
      # Top horizontal lines
      puts "-"*(2*Robot::BOARD_SIZE+1)

      0.upto(Robot::BOARD_SIZE-1) do |x|
        print "|"

        if robot.is_initialized?
          robot_x = robot.x
          robot_y = (Robot::BOARD_SIZE - 1) - robot.y # Invert y-axis since (0, 0) is at south-west corner

          if x == robot_x && y == robot_y # Show robot's direction with 1 letter
            print robot.direction.to_s.upcase[0,1]
            next
          end
        end

        print " "
      end
      puts "|"
    end

    # The bottom line
    puts "-"*(2*Robot::BOARD_SIZE+1)
  end
end
