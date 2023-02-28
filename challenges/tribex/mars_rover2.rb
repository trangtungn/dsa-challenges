#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

class MarsRover
  # Define constants for directions and movements
  DIRECTIONS = %w[North East South West].freeze
  MOVEMENTS = [[0, 1], [1, 0], [0, -1], [-1, 0]].freeze

  def initialize(x = 0, y = 0, dir = 0)
    # Initialize the rover's position and direction
    @position = [x, y]
    @direction = dir # index of the current direction in DIRECTIONS
  end

  def run
    # Main loop to process user input
    puts 'Mars Rover starting up'
    puts self
    loop do
      print '> '
      command = gets.chomp
      break if command == 'Q'

      process_command(command)
      puts self
    end
    puts 'Mars Rover shutting down'
  end

  private

  def turn_left
    # Turn the rover 90 degrees to the left
    @direction = (@direction - 1) % DIRECTIONS.length
  end

  def turn_right
    # Turn the rover 90 degrees to the right
    @direction = (@direction + 1) % DIRECTIONS.length
  end

  def move_forward
    # Move the rover one unit forward in the current direction
    dx, dy = MOVEMENTS[@direction]
    x, y = @position
    x += dx
    y += dy
    @position = [x, y]
  end

  def process_command(command)
    # Process a single command and update the rover's state
    case command
    when 'M'
      move_forward
    when 'L'
      turn_left
    when 'R'
      turn_right
    end
  end

  def to_s
    # Format the rover's state as a string
    direction = DIRECTIONS[@direction]
    x, y = @position
    "#{direction} (#{x}, #{y})"
  end
end

# Create a new MarsRover instance
rover = MarsRover.new
rover.run
