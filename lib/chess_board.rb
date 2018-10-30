require_relative './chess_pieces.rb'

#this will hold the board and create pieces objects
class ChessGame

    attr_accessor :board
    
    def initialize
        set_board
        @game_on = true
        create_pieces
    end

    def set_board
        @board = [
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

    def show_board
        rownum = 8
        @board.each do |row|
            puts "   +---+---+---+---+---+---+---+---+"
            print "#{rownum}  "
            row.each do |square|
                print "| #{square.symbol.encode('utf-8')} " unless square == ""
                print "|   " if square == ""
            end
            print "|"
            puts ""
            rownum -= 1
        end
        puts "   +---+---+---+---+---+---+---+---+"
        puts "     A   B   C   D   E   F   G   H "
    end

    #should allow input to move a piece
    #should allow second try if move invalid
    #special case instance to deal with 'check' situation
    def turn
        input = gets.chomp.downcase
        if input == 'move'
            move
        elsif input == 'hi'
            puts 'hey'
        end
        #placeholder to avoid errors for now
        @check = true
    end

    def invalid_move?
    end

    def find_piece


        @current_x = ""
        @current_y = ""
        

        until @xhash.include?(@current_x) && @yhash.include?(@current_y) && @board[@xhash.find_index(@current_x)][@yhash.find_index(@current_y)] != ""
            puts 'which column? (a-h)'
            @current_y = gets.chomp.downcase
            puts 'which row? (1-8)'
            @current_x = gets.chomp
            if @xhash.include?(@current_x) && @yhash.include?(@current_y)
                if @board[@xhash.find_index(@current_x)][@yhash.find_index(@current_y)] == ""
                    puts "nothing there"
                end
            else
            puts 'Invalid entry' 
            end
        end

        @board[@xhash.find_index(@current_x)][@yhash.find_index(@current_y)]
    end

    def move_piece(piece)   

        new_x = ''
        new_y = ''

        

        until @xhash.include?(new_x) && @yhash.include?(new_y)
            puts "moving #{piece.name}"
            puts 'which column? (a-h)'
            new_y = gets.chomp.downcase
            puts 'which row? (1-8)'
            new_x = gets.chomp
        
            puts 'Invalid entry' unless @xhash.include?(new_x) && @yhash.include?(new_y)

        end


        return false if invalid_move?
        @board[@xhash.find_index(new_x)][@yhash.find_index(new_y)] = piece
        @board[@xhash.find_index(@current_x)][@yhash.find_index(@current_y)] = ''

    end

    def move

        @xhash = ['8', '7', '6', '5', '4', '3', '2', '1']
        @yhash = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']

        piece = find_piece
        move_piece(piece)

        #checks to see if the move is valid
        #moves the piece
    end

    

    #should check to see if victory condition is met
    #thinking it'll check all possible king moves if check
    def victory?
    end

    def game_on?
        @game_on
    end

    def create_pieces
        create_white_pieces
        create_black_pieces
    end

    def create_white_pieces
        @board[7][0] = Rook.new(true)
        @board[7][7] = Rook.new(true)
        @board[7][1] = Knight.new(true)
        @board[7][6] = Knight.new(true)
        @board[7][2] = Bishop.new(true)
        @board[7][5] = Bishop.new(true)
        @board[7][3] = Queen.new(true)
        @board[7][4] = King.new(true)

        @board[6][0] = Pawn.new(true)
        @board[6][1] = Pawn.new(true)
        @board[6][2] = Pawn.new(true)
        @board[6][3] = Pawn.new(true)
        @board[6][4] = Pawn.new(true)
        @board[6][5] = Pawn.new(true)
        @board[6][6] = Pawn.new(true)
        @board[6][7] = Pawn.new(true)
    end

    def create_black_pieces
        @board[0][0] = Rook.new(false)
        @board[0][7] = Rook.new(false)
        @board[0][1] = Knight.new(false)
        @board[0][6] = Knight.new(false)
        @board[0][2] = Bishop.new(false)
        @board[0][5] = Bishop.new(false)
        @board[0][3] = Queen.new(false)
        @board[0][4] = King.new(false)

        @board[1][0] = Pawn.new(false)
        @board[1][1] = Pawn.new(false)
        @board[1][2] = Pawn.new(false)
        @board[1][3] = Pawn.new(false)
        @board[1][4] = Pawn.new(false)
        @board[1][5] = Pawn.new(false)
        @board[1][6] = Pawn.new(false)
        @board[1][7] = Pawn.new(false)
    end

end