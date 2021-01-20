# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'pacman')

class Grid
  attr_reader :pacman

  # attr_accessor :grid
  def initialize
    #@pacman = Pacman.new
    #@grid = Array.new(11) { Array.new(11) { ' .' } }
    gen_grid
    created_grid
  end

  def gen_grid
    @grid = Array.new(11) { Array.new(11) { ' .' } }
    @pacman = Pacman.new
    @grid[@pacman.position_y][@pacman.position_x] = @pacman
  end

  def print_grid
    puts @pacman.position_x
    puts @pacman.position_y
    #pos_pacman()
    (0..10).each do |y|
      (0..10).each do |x|
        print @grid[x][y]
      end
      print "\n"
    end
  end

  def generate_vertical_walls(position_x)
    y = 0
    while (y <= position_x - 1) && (y < 5)
      @grid[position_x][y] = ' |'
      y += 1
    end
  end

  def generate_horizontal_walls(position_x, position_y)
    @grid[position_x][position_y] = ' | '
    @grid[position_x - 1][position_y] = ' _'
    @grid[position_x + 1][position_y] = '_'
  end

  def set_position_pacman
    # metodo para modificar la posición
    @grid[@pacman.position_x][@pacman.position_y] = ' V'
  end

  def pos_pacman
    @grid[@pacman.position_x][@pacman.position_y] = ' '
    @pacman.steps
    @grid[@pacman.position_x][@pacman.position_y] = @pacman.avatar_position
    print_grid
  end

  def created_grid
    generate_vertical_walls(4)
    generate_vertical_walls(8)
    generate_horizontal_walls(8, 8)
    generate_horizontal_walls(3, 8)
    generate_horizontal_walls(6, 6)
  end
end

