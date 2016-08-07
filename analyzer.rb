stopwords = %w{the a by on for or are with just but and to the my I has in some}
text = ''
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

#count the characters
total_characters = text.length
total_characters_no_spaces = text.gsub(/\s/, '').length

#count the words, sentences, paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

#make a list of words in the text that aren't stop words,
#count them, and work out the percentage of non-stop words
#against all the words
all_words = text.scan(/\w+/)
good_words = all_words.select { |word| !stopwords.include?(word)}
#good_words = good_words.join(' ')
good_percentage = ((good_words.length.to_f / all_words.length.to_f) *100).to_i

#Summarize the test by cherry picking some choice sentences
sentences = text.gsub(/\s+/,' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by{ |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third,one_third + 1)
ideal_sentences = ideal_sentences.select{ |sentence| sentence =~ /is|are/ }

#Give analysis back to the user
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_no_spaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragrapgh (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{good_percentage}% of words are non fluff words."
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "- - End of analysis"




#Unused method to calculate how many words are used
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

