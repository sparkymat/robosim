class BoardController
  def initialize
    @robot = Robot.new
  end

  def parse_command(input)
    command,arguments = input.split(" ")
    
    return if command.nil?

    arguments = arguments.split(",") if !arguments.nil?

    return if command.downcase != "place" && !@robot.is_initialized?

    case command.downcase
    when "place"
      if !arguments.nil? && arguments.length >=3 
        x = arguments[0].to_i
        y = arguments[1].to_i
        direction = arguments[2].to_s.to_sym

        @robot.place(x,y,direction)
      end
    when "move"
      @robot.move 
    when "left"
      @robot.turn_left
    when "right"
      @robot.turn_right
    when "report"
    end
  end
end
