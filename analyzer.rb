text = ''
line_count = 0
File.open("oliver.txt").each do |line|
  line_count += 1
  text << line
end
puts line_count
def substrings(strings)
  hash = {}
  strings = strings.downcase.scan(/[\w']+/) #split string into array of words
  strings.each do |words| #Check each word out of the array
	if hash.has_key?(words) #If it already has key add one to the value
  	  hash[words] += 1
	else
	  hash[words] = 1 #else create key with value 1
	end
  end
  hash.map.sort_by {|_key, value| value}
  puts strings
end
puts substrings(text)
