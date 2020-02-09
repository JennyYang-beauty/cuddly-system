# Get My Number Game
# Written by:you!

puts "Welcome to 'Get My Number!'"
print "Whar's your name? "

input = gets
name = input.chomp

puts "Welcome,#{name}"


puts "I've got a random number between 1 and 100."
puts "Can you guess it?"
target = rand(100) + 1

num_guesses = 0
guessd_it = false

until num_guesses == 10 || guessd_it
	puts "You've got #{10 - num_guesses} guess left."
	print "Make a guess: "
	guess = gets.to_i
	
	num_guesses += 1
	
	if guess < target
		puts "Oops. Your guess was LOW."
	elsif guess > target
		puts "Oops. Your guess was HIGH."
	elsif guess == target
		puts "Good job, #{name}!"
		puts "You guessed my number in #{num_guesses} guesses!"
		guessd_it = true
	end
	
end

unless guessd_it
	puts "Sorry. You didn't get my number.(It was #{target}.)"
end