module Helpers

  module BoardHelper

    def fill_board_with_all_x(board)
      board.accept_move('X', 0, 0)
      board.accept_move('X', 0, 1)
      board.accept_move('X', 0, 2)
      board.accept_move('X', 1, 0)
      board.accept_move('X', 1, 1)
      board.accept_move('X', 1, 2)
      board.accept_move('X', 2, 0)
      board.accept_move('X', 2, 1)
      board.accept_move('X', 2, 2)
    end

    def fill_board_with_no_winner(board)
      board.accept_move('O', 0, 0)
      board.accept_move('X', 0, 1)
      board.accept_move('O', 0, 2)
      board.accept_move('X', 1, 0)
      board.accept_move('O', 1, 1)
      board.accept_move('X', 1, 2)
      board.accept_move('X', 2, 0)
      board.accept_move('O', 2, 1)
      board.accept_move('X', 2, 2)
    end

  end

end
