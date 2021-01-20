# frozen_string_literal: true

# Class for the pacman character
class Pac
  attr_reader :posi_x, :posi_y
  attr_accessor :avatar

  def initialize(posi_x, posi_y)
    @avatar = 'V'
    @posi_x = posi_x
    @posi_y = posi_y
  end

  def move_up
    @posi_y -= 1 if @posi_y != 0
  end

  def move_down
    @posi_y += 1 if @posi_y != 10
  end

  def move_right
    @posi_x += 1 if @posi_x != 11
  end

  def move_left
    @posi_x -= 1 if @posi_x != 0
  end
end
