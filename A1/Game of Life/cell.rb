# require_relative './game.rb'

# Class for creating cells and control their lifes
class Cell
  def initialize(game, game_size)
    @number_cells = 20
    @board = game
    @board_size = game_size
  end

  def set_livings_cell
    # (0..@number_cells).each do
    #   @board[rand(@board_size - 1)][rand(@board_size - 1)] = 1
    # end
    @board[2][2] = 1
    @board[2][3] = 1
    @board[2][4] = 1
    @board[1][3] = 1
    @board[1][4] = 1
    @board[1][5] = 1
  end

  def find_cells
    for col in 0..@board_size - 1
      for row in 0..@board_size - 1
    # (0..@board_size - 1).each do |col|
    #   (0..@board_size - 1).each do |row|
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