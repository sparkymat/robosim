require_relative "controllers/board_controller"
require 'readline'

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
