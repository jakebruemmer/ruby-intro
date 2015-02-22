puts "Welcome to the game of Minesweeper."
puts "-----------------------------------"
puts "How many rows would you like to play with?"
rows = gets.chomp.to_i
while !rows.is_a?(Integer)
    puts "How many rows would you like to play with?"
    rows = gets.chomp.to_i
end

puts "Ok, and how many columns would you like to play with?"
cols = gets.chomp.to_i
while !cols.is_a?(Integer)
    puts "Ok, and how many columns would you like to play with?"
    cols = gets.chomp.to_i
end

puts "Lastly, what is the percent chance that you're going to get a bomb?"
percent_bomb = gets.chomp.to_f
while percent_bomb > 1 || percent_bomb < 0
    puts "Please put in a number in between 0 and 1"
end


# Creating the array that is going to be used for the game board
game_board = Array.new(rows, '-') { Array.new(cols, '-') }
bomb_board = Array.new(rows) { Array.new(cols) }

game_board.each do |row|
    row.each_with_index do |value, index|
        if Random.rand < percent_bomb
            value = '*'
        end
        print "#{value} "
    end
    puts ""
end

# Now we can check for bombs
game_board.each do |row, row_index|
    row.each_with_index do |value, col_index|
        count = 0
        if value != '*'
            i = row_index - 1
            3.times do
                 j = col_index - 1
                 3.times do
                     if game_board[i][j] == '*'
                         count += 1
                     end
                     j += 1
                 end
                 i += 1
            end
        end
        bomb_board[row_index][col_index] = count 
    end
                    
end

