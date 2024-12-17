#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

class MarsRoverV3
  DIRECTION_LABELS = ['North', 'West', 'South', 'East']
  DIRECTIONS = [0, 1, 2, 3] # 'N', 'W', 'S', 'E'
  MOVEMENT_DIRECTIONS = [
      [0, 1],
      [-1, 0],
      [0, -1],
      [1, 0]
  ]

  def initialize(cur_dir = 0, cur_pos = [0, 0])
      @cur_dir = cur_dir
      @cur_pos = cur_pos
      puts "#{DIRECTION_LABELS[@cur_dir]} (#{@cur_pos[0]}, #{@cur_pos[1]})"
  end

  def forward
      @cur_pos[0] += MOVEMENT_DIRECTIONS[@cur_dir][0]
      @cur_pos[1] += MOVEMENT_DIRECTIONS[@cur_dir][1]

      @cur_pos
  end

  def turn_left
      @cur_dir = (@cur_dir + 1) % DIRECTIONS.length

      p "turn_left: #{@cur_dir}"
  end

  def turn_right
      @cur_dir = (@cur_dir - 1) % DIRECTIONS.length
      p "turn_right: #{@cur_dir}"
  end

  def move(cmd)
      case cmd
      when 'M'
          forward
          puts "#{DIRECTION_LABELS[@cur_dir]} (#{@cur_pos[0]}, #{@cur_pos[1]})"
      when 'L'
          turn_left
          puts "#{DIRECTION_LABELS[@cur_dir]} (#{@cur_pos[0]}, #{@cur_pos[1]})"
      when 'R'
          turn_right
          puts "#{DIRECTION_LABELS[@cur_dir]} (#{@cur_pos[0]}, #{@cur_pos[1]})"
      when 'Q'
          puts 'Mars Rover shutting down'
          exit
      end
  end
end

mr = MarsRover.new
mr.move('M')
mr.move('L')
mr.move('M')
mr.move('M')
mr.move('R')
mr.move('R')
mr.move('M')
mr.move('R')
mr.move('M')
mr.move('R')
mr.move('R')
mr.move('R')
mr.move('R')
mr.move('M')

mr.move('Q')
