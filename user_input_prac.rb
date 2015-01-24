#! usr/bin/env ruby

# This is a remake of the nutrition lab from CSE131, but written in Ruby.
def calculate_percent(food_part, stated_calories)
	return ((food_part / stated_calories) * 100).round(2)
end


if __FILE__ == $0

	# Ask for the name of the food
	puts "What is the name of the food? --> "
	food_name = gets.chomp

	# Ask for the carbs in the food
	puts "How many carbs are in the #{food_name}? --> "
	food_carbs = gets.chomp.to_f

	# Ask for the grams of fat in the food
	puts "How many grams of fat are in the #{food_name}? --> "
	food_fat = gets.chomp.to_f

	# Ask for grams of protein in the food
	puts "How many grams of protein are in the #{food_name}? --> "
	food_protein = gets.chomp.to_f

	# Ask for the stated calories of the food
	puts "How many calories does the #{food_name} have? --> "
	food_calories = gets.chomp.to_f

	# Now do the arithmetic
	calories_from_carbs = 4 * food_carbs
	calories_from_fat = (9 * food_fat) * 100 / 100
	calories_from_protein = 4 * food_protein
	total_calores = calories_from_protein + calories_from_fat + calories_from_carbs

	unavailable_calories = (total_calores - food_calories).round(2)
	food_fiber = (unavailable_calories / 4).round(2)
	
	percent_carbs = calculate_percent(calories_from_carbs, food_calories)
	percent_fat = calculate_percent(calories_from_fat, food_calories)
	percent_protein = calculate_percent(calories_from_protein, food_calories)

	low_carb = percent_carbs < 25
	low_fat = percent_fat < 15
	
	# Simulate a coin flip, and then check the result to determine a "heads" result
	coin_flip = rand
	heads = coin_flip < 0.5

	# Print out all of the information
	puts "#{food_name} has"
	puts "\t #{food_carbs} grams of carbohydrates = #{calories_from_carbs} Calories."
	puts "\t #{food_fat} grams of fat = #{calories_from_fat} Calories."
	puts "\t #{food_protein} grams of protein = #{calories_from_protein} Calories."
	puts "\n #{food_name} is said to have #{food_calories} (available) calories"
	puts "With #{unavailable_calories} unavailable_calories, this food has #{food_fiber} grams of fiber."
	puts "\n Approximately"
	puts "\t #{percent_carbs} % of your food is carbohydrates"
	puts "\t #{percent_fat} % of your food is fat"
	puts "\t #{percent_protein} % of your food is protein"
	puts "This food is acceptable for a low-fat diet? #{low_fat}"
	puts "This food is acceptable for a low-carb diet? #{low_carb}"
	puts "By coin-flip, should you eat this food? #{heads}"
		 
end
	