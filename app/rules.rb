# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'pacman')
require File.join(File.dirname(__FILE__), 'grid')

class Rules
  # attr_accessor :grid
  def initialize
    @grid = Grid.new
    @pacman = Pacman.new
    tick
    pacman_direction
  end

  def tick
    Thread.new do
      loop do
        @grid.print_grid
        # puts "tick"
        sleep 10
        puts "\e[H\e[2J" # clear screen  <- READY
      end
    end
  end

  def pacman_direction
    require 'io/console'
    loop do
      @user_input = $stdin.getch.upcase

      case @user_input
      when 'P' # Stop | PARAR
        print 'Gracias por jugar'
        exit
      when '['
        print ''
      else
        case @user_input
        when 'W'
          puts 'up'
          @pacman.move_up
          #@grid[@pacman.position_x][@pacman.position_y] = @pacman.avatar_position
          @grid.set_position_pacman
          @grid.print_grid
          @grid.pos_pacman
        when 'S'
          @pacman.move_down
          puts 'down'
        when 'D'
          @pacman.move_right
          puts 'right'
        when 'A'
          @pacman.move_left
          puts 'left'
        end
      end
    end
  end

  #     def set_clear_position_pacman()
  #         position_x_t = @pacman.position_x
  #         position_y_t = @pacman.position_y
  #         system("clear")
  #         @grid[position_x_t][position_y_t] = ' '
  #     end
  #
  #     def moving
  #       loop do
  #         system("clear")
  #         @grid[@pacman.position_y][@pacman.position_x] = ' '
  #         @pacman.steps
  #         @grid[@pacman.position_y][@pacman.position_x] = @pacman
  #         print_grid
  #         @pacpacman_direction.
  #       end
  #     end      @grid[@pacman.position_y][@pacman.position_x] = " "
end

Rules.new
