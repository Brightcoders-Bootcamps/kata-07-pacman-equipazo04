# frozen_string_literal: true

require_relative 'pac'

# Class for start the game
class Maps
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @mapa = create_maps
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
    @mapa.each do |y|
      y.each do |x|
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
      @mapa[@pac.posi_y][@pac.posi_x] = ' '
      case @input
      when 'W'
        if check_wall('W')
          @pac.move_up
          @pac.avatar = 'V'
        elsif
          puts "wall"
        end
        
      when 'A'
        @pac.move_left
        @pac.avatar = '>'
      when 'S'
        @pac.move_down
        @pac.avatar = '^'
      when 'D'
        @pac.move_right
        @pac.avatar = '<'
      when 'P'
        puts 'Adios!'
        exit
      end
      system('clear')
      print_maps
    end
  end

  def check_wall(option)
    case option
    when 'W'
      if @mapa[@pac.posi_y+1][@pac.posi_x]=='|' or @mapa[@pac.posi_y+1][@pac.posi_x] == '_'
        return false
      end
    when 'A'
      if @mapa[@pac.posi_y][@pac.posi_x-1]=='|' or @mapa[@pac.posi_y][@pac.posi_x-1] == '_'
        return false
      end
    end
  end


  def wall_generator #DONE
    n = 1
    while n <20
      @mapa[rand(0..@width-1)][rand(0..@height-1)] = (['|','_'].sample)
      n +=1
    end
  end
end

Maps.new(11, 11)
