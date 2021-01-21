# frozen_string_literal: true

require_relative 'pac'

# Class for start the game
class Maps
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @mapa = create_maps
    ubicate_pacman
    #print_maps
    #start_game
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
        @pac.move_up
        @pac.avatar = 'V'
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
end

#Maps.new(11, 11)
