# Build Conways' "Game of Life". In case you're unfamiliar, here is a short video describing the game:
# http://www.youtube.com/watch?v=XcuBvj0pw-E&noredirect=1

# As you can see, the Game of Life is a simple discrete simulation on a regular grid. It is governed by two rules:
# An empty square "comes to life" if it is adjacent to exactly three live squares
# A live square "dies" if it has less than two live neighbors, or more than three live neighbors
# However, in our version of the problem, the grid is finite, and the cells "wrap around". That means that on an n-by-n grid, the nth cell is always neighbors with the first cell. In the following example, the characters in bold would all be neighbors of x:

# h 0 f g
# 0 0 0 0
# c 0 a b
# e 0 d x
# Your simulation should be a command-line program that takes input from stdin and writes to stdout.  The input data will be in the following format:

# n
# w h
# <line>
# <line>
# <EOF>
# Where n is the number of iterations to run the simulation, w is the width (number of columns) and h is the height (number of rows) of the input data. Each line will consist of w characters, delimited by spaces. Each character in the line will either be 0 or 1, where 0 indicates a dead cell and 1 indicates a live cell.  Here is an example input:

# 14
# 3 3
# 0 0 0
# 0 1 0
# 0 0 0
# For this example, your program would run the simulation for 14 iterations on the given 3-by-3 grid.  When your program is done, it should write the current state of the board to stdout. For the previous example, it would write the following output:

# 0 0 0
# 0 0 0
# 0 0 0
# You may implement your solution in the language of your choosing. We welcome more interesting visualizations and UX, but do include a basic version that reads from stdin and writes to stdout.


# I took a pseudofunctional approach to solve it, even though there are limitations to do
# functional programming in ruby


def game_of_life(input)
  input       = input.split("\\n") #depends on how the input from stdin is we need \\n or \n
  iterations  = input[0].to_i
  rows        = input[1].split[1].to_i
  cols        = input[1].split[0].to_i
  input.shift
  input.shift
  board       = input.map{|e| e.split(' ').map{|i| i.to_i}} # the board is a 2D array
  # until this point we are preparing the data to be passed to the different methods

  iterations.times do
    board = next_board(board, rows, cols)
  end
  display(board) # method to display the board as expected each row in a different line
end

def next_board(board, rows, cols)
  next_board = []
  board.each_with_index do |row, x|
    next_board[x] =[]
    row.each_with_index do |unit, y|
      neighbors       = neighbors(rows, cols, x, y) # get all the neighbors for each unit(square)
      neighbors_alive = neighbors_alive(neighbors, board) # check how many neighbors are alive
      next_board[x][y] = next_status(neighbors_alive, unit) # change the value of unit (square) depending on the neighbors
    end
  end
  next_board
end

def neighbors(row, col, x, y)
  previous_line = [[x - 1, y - 1], [x-1, y], [x-1, (y+1)%row]]
  same_line = [[x, y-1], [x,(y+1)%row]]
  next_line = [[(x+1)%col, y-1], [(x+1)%col, y], [(x+1)%col, (y+1)%row]]
  neighbors = same_line + next_line + previous_line
end

def neighbors_alive(neighbors, board)
  neighbors.inject(0) {|memo, square| memo+= board[square[0]][square[1]]}
end

def next_status(neighbors_alive, status)
  return 1 if (status == 0 && neighbors_alive ==3 )
  return 1 if (status == 1 &&  2 < neighbors_alive && neighbors_alive <4)
  return 0
end

def display(next_board)
  next_board.each do |row|
    row.each do |e|
      print e
    end
    puts ''
  end
end

# driver code
# Input in the command lind should be something like `ruby game_of_life.rb "14\n3 3\n1 1 1\n1 1 1\n1 1 1" `

input = ARGV
game_of_life(input[0])
# p game_of_life("14\n3 3\n1 1 1\n1 1 1\n1 1 1")
