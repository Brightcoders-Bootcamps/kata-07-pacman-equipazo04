=begin
    tick = pacman.movement

    Wall
        when wall pacman.stop
        end
    end

    dot 
        when pacman postion == " ." 
            map postion == "  "
        end
    end

=end
class Rules
    def initialize
        pacman_direction
    end

    def tick #make a funtion that kills while
        while true do
            puts "Tick"
            # <-- call movement function
            sleep 1
            
        end
    end

    def pacman_direction #inicializar con pacman y llamar a las funciones de movimiento cuando esten listas 
        require 'io/console'
        while true
            user_input = $stdin.getch 
            user_input = user_input.upcase       
            case user_input
            when 'P' # Stop
                print 'Gracias por jugar' 
                exit
            when '['        
                print '' 
            else
                case user_input  
                when 'W'
                    puts "up"
                when 'S'
                    puts "down"
                when 'D'
                    puts "right"
                when 'A'
                    puts "left"
                end
            end
        end
    end

    

end

Rules.new
