# Class for creating cells and control their lifes
class Cell
  def initialize(game, game_size)
    @number_cells = 20
    @board = game
    @board_size = game_size
  end

  # Fills the matrix with 1 in random positions
  def livings_cell
    (0..@number_cells).each do
      @board[rand(@board_size - 1)][rand(@board_size - 1)] = 1
    end
    # @board[1][1] = 1
    # @board[1][2] = 1
    # @board[2][1] = 1
    # @board[2][3] = 1
    # @board[3][2] = 1
  end

  # This methods contains the basic rules of the game
  def find_cells
    for col in 0..@board_size - 1
      for row in 0..@board_size - 1
        @current = @board[col][row]
        @neighbors = check_neighbors(@board, col, row)
        if @current.zero? && @neighbors == 3
          @board[col][row] = 1
        elsif @current == 1 && (@neighbors < 2 || @neighbors > 3)
          @board[col][row] = 0
        else
          @board[col][row] = @current
        end
      end
    end
  end

  # This method check the number of neighbors of every cell
  def check_neighbors(matrix, col, row)
    sum = 0
    for x in -1..1
      for y in -1..1
        posX = (col + x)
        posY = (row + y)
        if posX >= 0 && posY >= 0
          if posX <= @board_size - 1 && posY <= @board_size - 1
            sum += matrix[posX][posY]
          end
        end
      end
    end
    sum -= matrix[col][row]
    sum
  end
end