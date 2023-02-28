#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

class MarsRover
  attr_accessor :x, :y, :direction, :started

  DIRECTIONS = {
    'North' => {
      'L' => 'West',
      'R' => 'East'
    },
    'East' => {
      'L' => 'North',
      'R' => 'South'
    },
    'South' => {
      'L' => 'East',
      'R' => 'West'
    },
    'West' => {
      'L' => 'South',
      'R' => 'North'
    }
  }.freeze

  # MOVEMENTS = {
  #   'L' => {
  #     'North' => 'West',
  #     'West' => 'South',
  #     'South' => 'East',
  #     'East' => 'North'
  #   },
  #   'R' => {
  #     'North' => 'East',
  #     'East' => 'South',
  #     'South' => 'West',
  #     'West' => 'North'
  #   }
  # }.freeze

  def initialize(x = 0, y = 0, direction = 'North')
    @x = x
    @y = y
    @direction = direction
    @started = true
  end

  def run
    @started = true

    while started
      input = gets.chomp
      move(input)
      p position
    end
  end

  def move(dir)
    p "dir: #{dir}"
    case dir
    when 'M'
      forward
    when 'L'
      @direction = DIRECTIONS[direction][dir]
    when 'R'
      @direction = DIRECTIONS[direction][dir]
    when 'Q'
      @started = false
      puts 'Mars Rover shutting down'
    end
  end

  def forward
    case direction
    when 'North'
      @y += 1
    when 'East'
      @x += 1
    when 'South'
      @y -= 1
    when 'West'
      @x -= 1
    end
  end

  def position
    "#{direction} (#{x}, #{y})"
  end
end

a = MarsRover.new
puts a.position

# input = gets.chomp

a.move('M')
p a.position

a.move('L')
p a.position

a.move('M')
p a.position

a.move('M')
p a.position

a.move('R')
p a.position

a.move('R')
p a.position

a.move('M')
p a.position

a.move('R')
p a.position

a.move('M')
p a.position

# a.move('Q')

a.run
