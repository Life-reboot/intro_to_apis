require "http"

system "clear"
puts "Welcome to the awesome weather app!"
puts "Enter a city:"
city = gets.chomp

response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&APPID=___")
weather_data = response.parse

temperature = weather_data["main"]["temp"]
description = weather_data["weather"][0]["description"]

puts "The temperature is #{temperature} degrees Farenheit with #{description}!"
