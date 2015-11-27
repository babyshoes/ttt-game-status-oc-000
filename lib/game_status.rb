# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6],
                     [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    position_taken?(board, combo[0]) &&
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]]
  end
end

def full?(board)
  board.each_with_index.all? { |square, i| position_taken?(board, i)}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  win_combo = won?(board)
  win_combo ? board[win_combo[0]] : nil
end
