require_relative './cell.rb'

# Main class for the game
class Game
  def initialize
    @matrix_size = 6
    @matrix = Array.new(@matrix_size) { Array.new(@matrix_size) }
    fill_matrix
    @cells = Cell.new(@matrix, @matrix_size)
  end

  def fill_matrix
    for row in 0...@matrix_size
      for col in 0...@matrix_size
    #(0..@matrix_size - 1).each do |col|
      #(0..@matrix_size - 1).each do |row|
        @matrix[col][row] = 0
      end
    end
  end

  def show_board
    @matrix.each do |row|
      print row.to_s
      print "\n"
    end
  end

  def start
    show_board
    @cells.set_livings_cell
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

game = Game.new
game.start