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

        puts "Selecting a piece."

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
            puts "#{piece.name} at #{@current_y}#{@current_x} selected"
            puts 'move to what column? (a-h)'
            new_y = gets.chomp.downcase
            move && return if new_y == "back"
            puts 'move to what row? (1-8)'
            new_x = gets.chomp
            move && return if new_x == "back"
        
            puts 'Invalid entry' unless @xhash.include?(new_x) && @yhash.include?(new_y)

        end

        #add pathfinding between two points - if path is occupied by piece
        #I think i'll do this by calculating the squares it'll move through and checking them one by one
        

        unless piece.name == "Knight"
            unless pathfinding(new_x, new_y)
                puts "Piece in the way"
                move_piece(piece)
                return
            end
        end

        #differentiate landing on enemy piece vs allied piece
        if @board[@xhash.find_index(new_x)][@yhash.find_index(new_y)] != ""
            if @board[@xhash.find_index(new_x)][@yhash.find_index(new_y)].is_white == piece.is_white
                puts "same color"
                move_piece(piece)
                return
            else
                puts "taking piece"
            end
        end


        if piece.valid_move?(@current_x.to_i, @yhash.find_index(@current_y).to_i, new_x.to_i, @yhash.find_index(new_y).to_i)
            puts "#{piece.name} to #{new_y}#{new_x}"
            @board[@xhash.find_index(new_x)][@yhash.find_index(new_y)] = piece
            @board[@xhash.find_index(@current_x)][@yhash.find_index(@current_y)] = ''
            piece.has_moved
        else
            puts "Invalid move. Try again."
            move_piece(piece)
        end

    end


    def move

        @xhash = ['8', '7', '6', '5', '4', '3', '2', '1']
        @yhash = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']

        piece = find_piece
        move_piece(piece)


        #finds the piece
        #checks to see if the move is valid
        #moves the piece
    end

    def pathfinding(new_x, new_y)

        xrange = (@xhash.find_index(@current_x)..@xhash.find_index(new_x)).to_a if @xhash.find_index(@current_x) < @xhash.find_index(new_x)
        xrange = (@xhash.find_index(new_x)..@xhash.find_index(@current_x)).to_a.reverse if @xhash.find_index(@current_x) > @xhash.find_index(new_x)

        yrange = (@yhash.find_index(@current_y)..@yhash.find_index(new_y)).to_a if @yhash.find_index(@current_y) < @yhash.find_index(new_y)
        yrange = (@yhash.find_index(new_y)..@yhash.find_index(@current_y)).to_a.reverse if @yhash.find_index(@current_y) > @yhash.find_index(new_y)

        path = []

        if yrange == nil
            #vertical
            xrange.each do |i| 
                path << @board[i][@yhash.find_index(@current_y)]
            end
        elsif xrange == nil
            #horizontal
            yrange.each do |i| 
                path << @board[@xhash.find_index(@current_x)][i]
            end
        else
            #diagonal
            xrange.each_with_index do |data, i|
                path << @board[data][yrange[i]]
            end
        end


        #shifting out starting square and ending square
        path.shift
        path.pop

        path.each do |data|
            if data != ''
                return false
            end
        end
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