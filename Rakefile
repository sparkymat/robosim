require_relative "controllers/board_controller"
require 'readline'

desc "Shows help"
task :default do |t|
  puts <<-EOS
Run 'rake console' for the interactive console. You can use the following commands:

 PLACE x,y,direction # x and y can be between 0 and 4 (inclusive). Direction is one of NORTH, EAST, SOUTH, WEST
 LEFT # This turns the robot left
 RIGHT # This turns the robot right
 MOVE # This moves the robot 1 cell forward (in the current direction). The robot does not move if it is at the edge of the board and would fall off.
 REPORT # This prints the current position and orientation of the robot.

 After every command, if the robot has been placed on the board, the board will be displayed. All commands except PLACE are ignored, until a successful PLACE command has been executed.
  EOS
end

desc "Starts the interactive console. Use Ctrl-C to exit."
task :console do |t|
  board_controller = BoardController.new
  
  begin
    while line = Readline.readline("> ", true)
      board_controller.parse_command(line)
    end
  rescue Interrupt
    puts ""
  end
end

namespace "test" do

desc "Runs the unit tests"
task :units do
  sh "ruby test/unit/robot_tests.rb"
end

end
