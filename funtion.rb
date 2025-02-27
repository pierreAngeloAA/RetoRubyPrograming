def merge_hashes(hash_1, hash_2)
    hash_1.merge(hash_2) { |_k, a, b| a + b }
end

def word_frequencies(string)
	string = (string.split("").select{|item| item != "!" && item != "."}).join("")
	string = string.split(" ").map{|item| item.downcase}
	string.tally
end

def group_words_by_length(fruits)
	fruits.group_by { |fruit| fruit.length }
end

def separate_even_odd(array_integer)
	{even: array_integer.select { |number| number.even? }, odd: array_integer.select { |number| number.odd? }} 
end

puts merge_hashes({a: 1, b: 2}, {b: 3, c: 4})

puts word_frequencies("Hello hello world! World world.")

puts "#{group_words_by_length(["apple", "banana", "cat", "dog", "elephant"])}"

puts separate_even_odd([1, 2, 3, 4, 5, 6])