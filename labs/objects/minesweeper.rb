#! usr/bin/env ruby
require_relative 'game_tile'
require_relative 'minesweeper_game'

puts "Welcome to the game of minesweeper!"
puts "-----------------------------------"
# puts "What difficulty would you like to play with? 1 for expert, 2 for hard, 3 for medium, and 4 for easy"
# difficulty = gets.chomp.to_i

# Create the board
board = {}
4.times do |row|
  4.times do |column|
    if rand < 0.25
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

4.times do |row|
  4.times do |column|

    # Set the right pointer object based on objects that have already been created.
    if column < 3
      board["(#{row}, #{column})"].adjacent["right"] = board["(#{row}, #{column + 1})"]
    end

    if row < 3
      board["(#{row}, #{column})"].adjacent["down_left"] = board["(#{row + 1}, #{column - 1})"]
      board["(#{row}, #{column})"].adjacent["down"] = board["(#{row + 1}, #{column})"]
      board["(#{row}, #{column})"].adjacent["down_right"] = board["(#{row + 1}, #{column + 1})"]
    end

  end
end

# Search for bombs
board.each do |key, value|
  begin 
    value.find_adjacent_bombs
  rescue
    # This rescue catches the NoMethodError that arises when trying to call the find_adjacent_bombs 
    # method on an edge cell. The error arises when trying to access the is_bomb attribute of a 
    # nil class. Hence, the NoMethodError.
  end
end

puts board
# Use the MinesweeperGame class to play the game
game = MinesweeperGame.new(board, 4, 4)

game.print_the_board
while !game.game_over? do
 game.play_the_game
end

