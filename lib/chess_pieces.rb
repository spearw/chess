#class piece should define moving and concepts like 'valid move'
#I'll create induvidual sub-classes that'll inheret these properties

class Piece

    attr_accessor :is_white, :symbol

    def initialize(white)
        @is_white = white
        @symbol = "\u2713"
        @has_moved = false
    end

    def has_moved
        @has_moved = true
    end



end

class Knight < Piece

    attr_accessor :name
    
    def name
        @name = 'Knight'
    end

    def symbol
        if is_white
            @symbol = "\u2658"
        else
            @symbol = "\u265E"
        end
    end

    def valid_move?(current_x, current_y, new_x, new_y)

        if current_x == new_x && current_y == new_y
            puts "Can't stay in place!"
            return false
        end

        if (current_x - new_x).abs == 1 && (current_y - new_y).abs == 2 || (current_x - new_x).abs == 2 && (current_y - new_y).abs == 1
            return true
        end


        return false

    end


end

class Pawn < Piece

    attr_accessor :name
    
    def name
        @name = 'Pawn'
    end

    def symbol
        if is_white
            @symbol = "\u2659"
        else
            @symbol = "\u265F"
        end
    end

    def valid_move?(current_x, current_y, new_x, new_y)

        if current_x == new_x && current_y == new_y
            puts "Can't stay in place!"
            return false
        end

        unless @has_moved

            if is_white == true
                if current_y == new_y && ((current_x - new_x) == -1 || (current_x - new_x) == -2)
                    return true
                end
            elsif is_white == false
                if current_y == new_y && ((current_x - new_x) == 1 || (current_x - new_x) == 2)
                    return true
                end
            end
        end

        if is_white == true
            if current_y == new_y && (current_x - new_x) == -1
                return true
            end
        elsif is_white == false
            if current_y == new_y && (current_x - new_x) == 1
                return true
            end
        end

        return false
        

    end

end

class Rook < Piece

    attr_accessor :name

    def name
        @name = 'Rook'
    end

    def symbol
        if is_white
            @symbol = "\u2656"
        else
            @symbol = "\u265C"
        end
    end

    def valid_move?(current_x, current_y, new_x, new_y)

        if current_x == new_x && current_y == new_y
            puts "Can't stay in place!"
            return false
        end

        if current_x != new_x && current_y != new_y
            return false
        end


        return true

    end
end

class Bishop < Piece

    attr_accessor :name

    def name
        @name = 'Bishop'
    end

    def symbol
        if is_white
            @symbol = "\u2657"
        else
            @symbol = "\u265D"
        end
    end

    def valid_move?(current_x, current_y, new_x, new_y)

        if current_x == new_x && current_y == new_y
            puts "Can't stay in place!"
            return false
        end

        if (current_x - new_x).abs == (current_y - new_y).abs
            return true
        end

        return false

    end
end

class King < Piece

    attr_accessor :name

    def name
        @name = 'King'
    end

    def symbol
        if is_white
            @symbol = "\u2654"
        else
            @symbol = "\u265A"
        end
    end

    def valid_move?(current_x, current_y, new_x, new_y)

        if current_x == new_x && current_y == new_y
            puts "Can't stay in place!"
            return false
        end

        if (current_x - new_x).abs > 1 || (current_y - new_y).abs >1
            return false
        end

        return true

    end
end

class Queen < Piece

    attr_accessor :name

    def name
        @name = 'Queen'
    end

    def symbol
        if is_white
            @symbol = "\u2655"
        else
            @symbol = "\u265B"
        end
    end

    def valid_move?(current_x, current_y, new_x, new_y)

        if current_x == new_x && current_y == new_y
            puts "Can't stay in place!"
            return false
        end

        if (current_x.to_i - new_x).abs == (current_y.to_i - new_y).abs
            return true
        end

        if current_x != new_x && current_y != new_y
            return false
        end

        return true

    end

end