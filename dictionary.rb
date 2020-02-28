require "http"

while true
  system "clear"
  puts "Welcome to the Dictionary app!"
  print "Enter a word: "
  input_word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=___")
  definitions = response.parse

  response = HTTP.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=___")
  pronunciations = response.parse

  puts "DEFINITIONS: "
  index = 0
  while index < definitions.length
    definition = definitions[index]
    puts "#{index + 1}. #{definition["text"]}"
    index = index + 1
  end
  puts

  puts "PRONUNCIATIONS"
  index = 0
  while index < pronunciations.length
    pronunciation = pronunciations[index]
    puts "#{index + 1}. #{pronunciation["raw"]}"
    index = index + 1
  end

  puts "Enter q to quit, any other key to continue"
  input_option = gets.chomp
  if input_option == "q"
    puts "Thank you, goodbye!"
    break
  end
end
