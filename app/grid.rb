require File.join(File.dirname(__FILE__), 'pacman')

class Grid
    attr_reader :pacman
    def initialize
        @pacman = Pacman.new
        @grid = Array.new(11) {Array.new(11) {' .'}}
        @pacman.initial_position
        created_grid
        print_grid
    end

    def print_grid
        for y in (0..10)
            for x in (0..10)
                print @grid[x][y]
            end
            print "\n"
        end
    end

    def generate_vertical_walls(position_x)
        y = 0
        while y <= position_x-1 and y < 5
            @grid[position_x][y] = ' |'
            y += 1            
        end   
    end

    def generate_horizontal_walls(position_x, position_y)
        @grid[position_x][position_y] = ' | '
        @grid[position_x-1][position_y] = ' _'
        @grid[position_x+1][position_y] = '_'
    end

    def set_position_pacman()
        #metodo para modificar la posición
        position_x_t = position_x
        position_y_t = position_y
        @grid[@pacman.position_x][@pacman.position_y] = ' V'
    end

    def created_grid
        generate_vertical_walls(4)
        generate_vertical_walls(8)
        generate_horizontal_walls(8,8)
        generate_horizontal_walls(3,8)
        generate_horizontal_walls(6,6)
        set_position_pacman()
    end
end

Grid.new