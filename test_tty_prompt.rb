require "tty-prompt"

prompt = TTY::Prompt.new
answer = prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))

puts "Your answer is #{answer}"
