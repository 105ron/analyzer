text = ''
lines = File.readlines("oliver.txt")
line_count = lines.size
text = lines.join
total_characters = text.length
total_characters_no_spaces = text.gsub(/\s/, '').length
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_no_spaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragrapgh (average)"
puts "#{word_count / sentence_count} words per sentence (average)"

text = "Los Angles has the nicest online weather forecast in the country."
words = text.scan(/\w+/)
stopwords = %w{the a by on for or are with just but and to the my I has in some}
keywords = words.select { |word| !stopwords.include?(word)}
puts keywords.join(' ')
puts ((keywords.length.to_f / words.length.to_f) *100).to_i


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
  hash.map.sort_by {|key, value| value}
end
