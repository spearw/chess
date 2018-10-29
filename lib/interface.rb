require_relative './chess_board.rb'
require_relative './chess_pieces.rb'

#users interact here


def interface(chess_game)

    puts 'Welcome to chess'
    puts 'starting new game'
    puts chess_game.game_on?
    while chess_game.game_on? 
        chess_game.show_board
        chess_game.turn
        chess_game.victory? if @check
    end
end


chess_game = ChessGame.new


#this is how the game starts
interface(chess_game)