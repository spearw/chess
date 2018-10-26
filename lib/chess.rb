
#class piece should define moving and concepts like 'valid move'
#I'll create induvidual sub-classes that'll inheret these properties

class Piece < ChessGame

    attr_accessor :position :color

    def initialize(position, color)
        @position = position
        @color = color
    end

    def invalid_move?
    end

    def move(x, y)
        return false if invalid_move?
        @position = ([x][y])

        #checks to see if the move is valid
        #moves the piece
    end

end

class Knight < Piece
end

class Pawn < Piece
end

class Rook < Piece
end

class Bishop < Piece
end

class King < Piece
end

class Queen < Piece
end

#this will hold the board, and allow you to enter commands to move pieces around
class ChessGame

    attr_accessor :board
    
    def initialize
        set_board
        @game = true
        interface
    end

    def set_board
        board = [
        ['','','','','','','',''],
        ['','','','','','','',''],
        ['','','','','','','',''],
        ['','','','','','','',''],
        ['','','','','','','',''],
        ['','','','','','','',''],
        ['','','','','','','',''],
        ['','','','','','','','']
        ]

    end

    def interface

        puts 'Welcome to chess'
        puts 'starting new game'

        while @game 
            turn
            victory? if @check
        end
    end

    #should allow input to move a piece
    #should allow second try if move invalid
    #special case instance to deal with 'check' situation
    def turn

        #placeholder to avoid errors for now
        @check = true
    end


    #should check to see if victory condition is met
    #thinking it'll check all possible king moves if check
    def victory?
    end

end

game = ChessGame.new