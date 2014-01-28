module Helpers

  module BoardHelper

    def fill_board_with_all_x(board)
      board.accept_move('X', 'A', '1')
      board.accept_move('X', 'A', '2')
      board.accept_move('X', 'A', '3')
      board.accept_move('X', 'B', '1')
      board.accept_move('X', 'B', '2')
      board.accept_move('X', 'B', '3')
      board.accept_move('X', 'C', '1')
      board.accept_move('X', 'C', '2')
      board.accept_move('X', 'C', '3')
    end

    def fill_board_with_no_winner(board)
      board.accept_move('O', 'A', '1')
      board.accept_move('X', 'A', '2')
      board.accept_move('O', 'A', '3')
      board.accept_move('X', 'B', '1')
      board.accept_move('O', 'B', '2')
      board.accept_move('X', 'B', '3')
      board.accept_move('X', 'C', '1')
      board.accept_move('O', 'C', '2')
      board.accept_move('X', 'C', '3')
    end

  end

end
