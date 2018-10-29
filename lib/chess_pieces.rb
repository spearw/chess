#class piece should define moving and concepts like 'valid move'
#I'll create induvidual sub-classes that'll inheret these properties

class Piece

    attr_accessor :is_white, :name, :symbol

    def initialize(white)
        @is_white = white
        @name = 'Piece'
        @symbol = "\u2713"
    end



end

class Knight < Piece

    attr_accessor :name

    @name = 'Knight'

    def symbol
        if is_white
            @symbol = "\u2658"
        else
            @symbol = "\u265E"
        end
    end

end

class Pawn < Piece

    attr_accessor :name
    
    @name = 'Pawn'

    def symbol
        if is_white
            @symbol = "\u2659"
        else
            @symbol = "\u265F"
        end
    end

end

class Rook < Piece

    attr_accessor :name

    @name = 'Rook'

    def symbol
        if is_white
            @symbol = "\u2656"
        else
            @symbol = "\u265C"
        end
    end
end

class Bishop < Piece

    attr_accessor :name

    @name = 'Bishop'

    def symbol
        if is_white
            @symbol = "\u2657"
        else
            @symbol = "\u265D"
        end
    end
end

class King < Piece

    attr_accessor :name

    @name = 'King'

    def symbol
        if is_white
            @symbol = "\u2654"
        else
            @symbol = "\u265A"
        end
    end
end

class Queen < Piece

    attr_accessor :name

    @name = 'Queen'

    def symbol
        if is_white
            @symbol = "\u2655"
        else
            @symbol = "\u265B"
        end
    end
end