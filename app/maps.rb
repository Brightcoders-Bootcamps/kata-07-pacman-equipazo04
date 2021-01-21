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
      case @input
      when 'W'
          if check_wall('W')
          eat_ball
          @pac.move_up
          @pac.avatar = 'V'
          elsif 
            @pac.avatar = 'V'
          end
      when 'A'
        if check_wall('A')
        eat_ball
        @pac.move_left
        @pac.avatar = '>'
        elsif
          @pac.avatar = '>'
        end
      when 'S'
        if check_wall('S')
        eat_ball
        @pac.move_down
        @pac.avatar = '^'
        elsif
          @pac.avatar = '^'
        end
      when 'D'
        if check_wall('D')
        eat_ball
        @pac.move_right
        @pac.avatar = '<'
        elsif
          @pac.avatar= '<'
        end

      when 'P'
        puts 'Adios!'
        exit
      end
      #system('clear')
      print_maps
    end
  end

  def eat_ball
    @mapa[@pac.posi_y][@pac.posi_x] = ' '
  end

  def check_wall(option)
    print @mapa[@pac.posi_y+1][@pac.posi_x]
    case option
      when 'W'
        if @mapa[@pac.posi_y-1][@pac.posi_x]=='|' or @mapa[@pac.posi_y-1][@pac.posi_x]=='_'
          op= false
        elsif
          op= true
        end
      return op

      when 'S'
        if @mapa[@pac.posi_y+1][@pac.posi_x]=='|' or @mapa[@pac.posi_y+1][@pac.posi_x]=='_'
          op= false
        elsif
          op= true
        end
      return op

      when 'D'
        if @mapa[@pac.posi_y][@pac.posi_x+1]=='|' or @mapa[@pac.posi_y][@pac.posi_x+1]=='_'
          op= false
        elsif
          op= true
        end
      return op

      when 'A'
        if @mapa[@pac.posi_y][@pac.posi_x-1]=='|' or @mapa[@pac.posi_y][@pac.posi_x-1]=='_'
          op= false
        elsif
          op= true
        end
      return op
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
