require File.join(File.dirname(__FILE__), 'rules')
 
 
# Class for Pacman character
class Pacman
 attr_reader :avatar_position, :position_x, :position_y
 
 def initialize
   @avatar_position = 'V'
   initial_position
 end
 
 def initial_position
   @position_x = 5
   @position_y = 5
 end
 
 def pacman_move(user_input)
   @user_input = gets
   @grid = grid unless grid.nil?
 end
 
 def pacman_direction(user_input)
   if @user_input == 'w' || @user_input == 'W'
     pacman_direction = 'V'
   elsif @user_input == 'a' || @user_input == 'A'
       pacman_direction = '>'
   elsif @user_input == 's' || @user_input == 'S'
       pacman_direction = '^'
   elsif @user_input == 'd' || @user_input == 'D'
       pacman_direction = '<'
   end
 end
 
 def move_direction
 end
 
end
