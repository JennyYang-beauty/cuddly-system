puts "hello"
print "world"
puts "!"

file = File.new("input.txt","w+")




for index in 0..10
	file.syswrite("I will try write ABC. #{index} \n")
end





line_num=0
file_input=File.open('read.txt','r')
file_input.each_line do |line|
  print "#{line_num += 1} #{line}"
end