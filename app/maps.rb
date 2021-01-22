# frozen_string_literal: true

require_relative 'pac'

# Class for start the game
class Maps
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @mapa = create_maps
    @pared_horizontal = '|'
    @pared_vertical = '_'
    wall_generator
    ubicate_pacman
    print_maps
    start_game
  end

  def create_maps
    Array.new(@width) { Array.new(@height) { '.' } }
  end

  def print_maps
    move_pacman
    @mapa.each do |position_y|
      position_y.each do |position_x|
        print "#{x} "
      end
      puts ''
    end
  end

  def move_pacman
    @mapa[@pac.posi_y][@pac.posi_x] = @pac.avatar
  end

  def ubicate_pacman
    @pac = Pac.new(5, 5)
    @mapa[@pac.posi_y][@pac.posi_x] = @pac.avatar
  end

  def start_game
    loop do
      @input = $stdin.gets.chomp
      Thread.new do
        loop do
          case @input
          when 'W'
            if check_wall('W')
              eat_ball
              @pac.move_up
              @pac.avatar = 'V'
            else @pac.avatar = 'V'
            end
          when 'A'
            if check_wall('A')
              eat_ball
              @pac.move_left
              @pac.avatar = '>'
            else @pac.avatar = '>'
            end
          when 'S'
            if check_wall('S')
              eat_ball
              @pac.move_down
              @pac.avatar = '^'
            else @pac.avatar = '^'
            end
          when 'D'
            if check_wall('D')
              eat_ball
              @pac.move_right
              @pac.avatar = '<'
            else @pac.avatar = '<'
            end

          when 'P'
            puts 'Adios!'
            exit
          end
          system('clear')
          print_maps
          sleep 5
        end
      end
    end
  end

  def eat_ball
    @mapa[@pac.posi_y][@pac.posi_x] = ' '
  end

  def check_wall(option)
    case option
        when 'W'
        check_wall_position(@pac.posi_y-1,@pac.posi_x)

        when 'S'
        check_wall_position(@pac.posi_y+1,@pac.posi_x)

        when 'D'
        check_wall_position(@pac.posi_y,@pac.posi_x+1)

        when 'A'
            check_wall_position(@pac.posi_y,@pac.posi_x-1)
    end
  end

  # DONE
  def wall_generator
    inicializador_wall_generator = 1
    while inicializador_wall_generator < 20
      @mapa[rand(0..@width - 1)][rand(0..@height - 1)] = ['|', '_'].sample
      inicializador_wall_generator += 1
    end
  end

  def check_wall_position(position_y,position_x)
        if (@mapa[position_y][position_x] == @pared_horizontal) || (@mapa[position_y][position_x] == @pared_vertical)
            false
        else true
        end
  end
end

Maps.new(11, 11)
