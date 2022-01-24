# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
require 'byebug'

def all_vowel_pairs(words)
    vowels = ["a","e","i","o","u"]
    v_pairs = []
    words.each.with_index do |word1, idx|
        temp = ""
        words.each.with_index do |word2, i|
            if i > idx
                temp = "#{word1.to_s} #{word2.to_s}"
                #return temp
                #debugger
                v_pairs << temp if vowels.all? {|vowel| temp.include?(vowel)}
            end
        end
    end
    return v_pairs
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |i|
        return true if num % i == 0
    end
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    arr = []                    #can just do bigrams.select {|bigram| str.include?(bigram)}
    bigrams.each do |duo|
        if str.include?(duo)
            arr << duo
        end
    end
    return arr
end

class Hash

    #attr_writer :hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}

    # def initialize(hash)
    #     @hash = hash
    # end

    def my_select(&prc)
        #debugger
        # new hash = {}
        prc ||= Proc.new {|k, v| k == v }
        # self.each do |k, v|
        #     new_hash[k] = v if prc.call(k, v)
        # end


        #hash_2 = self.hash_1
        return self.select {|k,v| prc.call(k,v)}

        # return prc.call(@hash_1)
        # no_prc_hash = @hash_1.select {|k,v| @hash_1[k] == v}.to_h
        # prc_hash = @hash_1.select {|key, val| prc.call(@hash_1) == true}.to_h
        # return no_prc_hash
        # prc ||= return no_prc_hash
        # return prc_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        new_arr = []
        new_length = self.length
        (0...new_length).each do |ele|
            (ele...new_length).each do |ele2|
                if length == nil
                    new_arr << self[ele..ele2]
                else
                    new_arr << self[ele..ele2] if self[ele..ele2].length == length
                end
            end
        end
        return new_arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ('a'..'z').to_a
        return self.each_char.map {|char| alpha[(alpha.index(char) + num) % 26]}.join("")
    end
end
