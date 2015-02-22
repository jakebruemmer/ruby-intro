#! usr/bin/env ruby
require_relative 'game_tile'
require_relative 'minesweeper_game'

puts "Welcome to the game of minesweeper!"
puts "-----------------------------------"
puts "Please enter the amount of rows that you would like to play with, anything more than 20 will be truncated."
rows = gets.chomp.to_i

while !rows.is_a?(Integer) do
  puts "Please enter the amount of rows that you would like to play with, anything more than 20 will be truncated."
  rows = gets.chomp.to_i
end

puts "Please enter the amount of rows that you would like to play with, anything more than 20 will be truncated."
cols = gets.chomp.to_i

while !cols.is_a?(Integer) do
  puts "Please enter the amount of rows that you would like to play with, anything more than 20 will be truncated."
  cols = gets.chomp.to_i
end

puts "Please enter the % chance you want for a bomb to occur"
bomb_chance = gets.chomp.to_f

while !bomb_chance.is_a?(Float) do
  puts "Please enter the % chance you want for a bomb to occur"
  bomb_chance = gets.chomp.to_f
end

# Create the board
board = {}
rows.times do |row|
  cols.times do |column|
    if rand < bomb_chance
      board["(#{row}, #{column})"] = GameTile.new(nil, nil, nil, nil, nil, nil, nil, nil, true)
    else
      board["(#{row}, #{column})"] = GameTile.new(nil, nil, nil, nil, nil, nil, nil, nil, false)
    end


    # Set the left pointers to GameTile objects that have already been created.
    if column > 0
      board["(#{row}, #{column})"].adjacent["left"] = board["(#{row}, #{column - 1})"]
    end
   
    # Set the up_left, up, and up_right pointers to objects that have been created. Edge 
    # cases are automatically handled because Hashes return nil for keys that do not 
    # exist in the hash.
    if row > 0
      board["(#{row}, #{column})"].adjacent["up"] = board["(#{row - 1}, #{column})"]
      board["(#{row}, #{column})"].adjacent["up_left"] = board["(#{row - 1}, #{column - 1})"]
      board["(#{row}, #{column})"].adjacent["up_right"] = board["(#{row - 1}, #{column + 1})"]
    end
    
  end
end

rows.times do |row|
  cols.times do |column|

    # Set the right pointer object based on objects that have already been created.
    if column < cols - 1
      board["(#{row}, #{column})"].adjacent["right"] = board["(#{row}, #{column + 1})"]
    end

    if row < rows - 1
      board["(#{row}, #{column})"].adjacent["down_left"] = board["(#{row + 1}, #{column - 1})"]
      board["(#{row}, #{column})"].adjacent["down"] = board["(#{row + 1}, #{column})"]
      board["(#{row}, #{column})"].adjacent["down_right"] = board["(#{row + 1}, #{column + 1})"]
    end

  end
end

# Search for bombs
board.each do |key, value|
  value.find_adjacent_bombs
  value.find_adjacent_zeroes
end

# Use the MinesweeperGame class to play the game
game = MinesweeperGame.new(board, rows, cols)

game.print_the_board
while !game.game_over? do
 game.play_the_game
end

puts "Oops! You selected a bomb. Please play again!"

