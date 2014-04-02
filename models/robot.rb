class Robot
  attr_reader :x, :y, :direction # Getters only, since we want to validate any changes in position or direction

  BOARD_SIZE = 5
  DIRECTIONS = %i(north east south west) # listed in clockwise order (to aid in turning by incrementing index)

  def initialize
    @x = nil
    @y = nil
    @direction = nil
  end

  def place(x, y, direction)
    return if !is_position_valid?(x, y)
    return if !is_direction_valid?(direction)
    
    @x = x
    @y = y
    @direction = direction
  end

  def move
    case @direction
    when :north
      self.place(@x, @y+1, @direction)
    when :south
      self.place(@x, @y-1, @direction)
    when :east
      self.place(@x+1, @y, @direction)
    when :west
      self.place(@x-1, @y, @direction)
    end
  end

  def turn_left # or anti-clockwise
    direction_index = DIRECTIONS.index(@direction)
    return if direction_index.nil?

    direction_index -= 1
    direction_index %= DIRECTIONS.length # looping back to north

    self.place(@x, @y, DIRECTIONS[direction_index])
  end

  def turn_right # or clockwise
    direction_index = DIRECTIONS.index(@direction)
    return if direction_index.nil?
    
    direction_index += 1
    direction_index %= DIRECTIONS.length # looping back to north

    self.place(@x, @y, DIRECTIONS[direction_index])
  end

  def report
    return nil if !self.is_initialized?

    {
      x: @x,
      y: @y,
      direction: @direction
    }
  end

  def is_initialized?
    !(@x.nil? || @y.nil? || @direction.nil?)
  end

  protected

  def is_position_valid?(x,y)
    return false if (x < 0 || x >= BOARD_SIZE)
    return false if (y < 0 || y >= BOARD_SIZE)

    true
  end

  def is_direction_valid?(direction)
    DIRECTIONS.include?(direction)
  end
end
