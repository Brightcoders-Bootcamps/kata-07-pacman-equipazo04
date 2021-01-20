# frozen_string_literal: true

# Class for Pacman character
class Pacman
  attr_accessor :avatar_position, :position_x, :position_y

  def initialize
    @avatar_position = ' V'
    # initial_position
    @position_x = 5
    @position_y = 5
  end

  def pacman_direction(_user_input)
    case @user_input
    when 'w', 'W'
      pacman_direction = 'V'
    when 'a', 'A'
      pacman_direction = '>'
    when 's', 'S'
      pacman_direction = '^'
    when 'd', 'D'
      pacman_direction = '<'
    end
  end

  def move_up
    if check_limit_array_y ? @position_y = 0 : @position_y += 1
    end
  end

  def move_down
    if check_limit_array_y ? @position_y = 0 : @position_y -= 1
    end
  end

  def move_right
    if check_limit_array_x ? @position_x = 0 : @position_x += 1
    end
  end

  def move_left
    if check_limit_array_x ? @position_x = 0 : @position_x -= 1
    end
  end

  def check_limit_array_x
    return if @position_x.negative? || @position_x > 11
  end

  def check_limit_array_y
    return if @position_y.negative? || @position_y > 11
  end

  def steps
    move_up if @user_input == 'W'
    move_down if @user_input == 'S'
    move_right if @user_input == 'D'
    move_left if @user_input == 'A'
  end
end
