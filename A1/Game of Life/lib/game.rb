require_relative './cell.rb'

# Main class for the game of life
class Game
  def initialize
    @matrix_size = 6
    @matrix = Array.new(@matrix_size) { Array.new(@matrix_size) }
    fill_matrix
    @cells = Cell.new(@matrix, @matrix_size)
  end

  # Fill the matrix with 0
  def fill_matrix
    for row in 0...@matrix_size
      for col in 0...@matrix_size
        @matrix[col][row] = 0
      end
    end
  end

  # Displays the matrix on the terminal
  def show_board
    @matrix.each do |row|
      print row.to_s
      print "\n"
    end
  end

  # This method calls the other methods to start the game
  def start
    show_board
    @cells.livings_cell
    print "\n"
    show_board
    print "\n"
    (0..10).each do |i|
      @cells.find_cells
      show_board
      print "\n"
    end
  end
end

#game = Game.new
#game.start