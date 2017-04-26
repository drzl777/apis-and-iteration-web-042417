def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars API!"
end

def get_character_from_user(all_characters)


  # use gets to capture the user's input. This method should return that input, downcased.
  character_index = 0
  while character_index < 1 || character_index > all_characters.size
    puts "Please pick a character by number to see what movies they're in"
    puts "------------------"
    all_characters.each_with_index {|character_hash,index|
      puts "#{index + 1}. #{character_hash["name"]}"
      puts "---"
    }
    character_index = gets.chomp.to_i
  end
  all_characters[character_index - 1]["name"] #inputted integer - 1
end
