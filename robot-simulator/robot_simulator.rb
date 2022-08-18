class Robot
  DIRECTION = %i[north east south west].freeze

  attr_accessor :bearing, :coordinates

  def orient(direction)
    raise ArgumentError unless DIRECTION.include?(direction)

    @bearing = direction
  end

  def turn_right
    # find_indexだと、Robot::DIRECTION見ないといけないので不便？
    i = (DIRECTION.find_index(@bearing) + 1) % 4
    @bearing = DIRECTION[i]
  end

  def turn_left
    # find_indexだと、Robot::DIRECTION見ないといけないので不便？
    i = (DIRECTION.find_index(@bearing) - 1) % 4
    @bearing = DIRECTION[i]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case @bearing
    when :north
      @coordinates[1] += 1
    when :east
      @coordinates[0] += 1
    when :south
      @coordinates[1] -= 1
    when :west
      @coordinates[0] -= 1
    end
  end
end

class Simulator
  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }.freeze

  def instructions(string)
    string.chars.map { |char| INSTRUCTIONS[char] }
  end

  def place(robot, x: 0, y: 0, direction: :north)
    robot.orient(direction)
    robot.at(x, y)
  end

  def evaluate(robot, string)
    command = instructions(string)
    command.each { |method| robot.method(method).call }
  end
end
