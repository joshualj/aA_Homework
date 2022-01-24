require 'byebug'

def no_dupes?(arr)
    counter = Hash.new(0)
    arr.each {|ele| counter[ele] += 1}
    return counter.keys.select {|key| counter[key] == 1 }
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    return true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)           #unsure why the commented text returns blank
    indices = Hash.new {|hash, key| hash[key] = []}        #Hash.new([]) does not work
    str.each_char.with_index {|char, idx| indices[char] << idx}
    return indices
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)         #I don't think this is correct ***
    char_counter = Hash.new(0)
    str.each_char.with_index do |char, i|
        if str[i - 1] == char          #if previous character is the same as char, add 1 to current char count
            char_counter[char] += 1
        else                            #if previous character is not the same as char, set char count to 1
            char_counter[char] = 1
        end
    end
    sorted = char_counter.sort_by {|k,v| v}.to_h     #sort hash by increasing values
    num = sorted.values[-1]              #num equals highest value
    new_str = ''
    num.times do
        new_str << sorted.keys[-1]               #print the key with the highest value, value times
    end
    return new_str
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    prime_facts = []
    (2...num).each do |i|
        prime_facts << i if is_prime?(i)
    end
    prime_facts.each do |num1|
        prime_facts.each do |num2|
            return true if num1 * num2 == num
        end
    end
    return false
end

def is_prime?(factor)
    return false if factor < 2

    (2...factor).each do |fact|          #pretty sure this code does not return true for 2 (it does not count 2 as a prime #) --> NOPE IT'S GOOD --> (2...2) does not include 2
        p fact
        p " "
        #return false if factor % fact == 0
    end
    return true
end

#p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(word, key)
    key_index = 0
    new_str = ""
    alpha = ("a".."z").to_a
    word.each_char do |char|
        #debugger
        new_str << alpha[(alpha.index(char.downcase) + key[key_index]) % 26]
        key_index = (key_index + 1) % (key.length)
    end
    return new_str
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    #vow = []
    vowels = "aeiou"
    new_str = ""
    vow = str.each_char.select {|char| vowels.include?(char.downcase)}

    control_index = 0
    str.each_char do |char|
        if !vowels.include?(char.downcase)
            new_str << char
        else
            new_str << vow[(control_index - 1) % vow.length]
            control_index += 1
        end
    end
    return new_str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        new_str = ""
        return new_str if prc == nil
        self.each_char {|char| new_str << char if prc.call(char)}
        return new_str
    end

    def map!(&prc)
        self.each_char.with_index {|char, i| self[i] = prc.call(char, i)}
        return self
    end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

def multiply(a, b)
    return 0 if a == 0 || b == 0
    if (b < 0 && a < 0) || (b > 0 && a > 0)
        a.abs + multiply(a.abs, b.abs - 1)
    elsif b < 0 && a > 0
        b + multiply(a - 1, b)
    else
        a + multiply(a, b - 1)
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    #debugger
    arr = []
    return arr if num == 0
    return arr << 2 if num == 1
    if num == 2
        arr << 2
        return arr << 1
    end

    lucas_sequence(num - 1) << lucas_sequence(num - 2).pop + lucas_sequence(num - 1).pop
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]


def prime_factorization(num)
    arr = []
    return arr << num if is_prime?(num)

    j = nil
    i = 2
    while j == nil
        if num % i != 0 || !is_prime?(i)
            i += 1
            next
        else
            j = i
        end
    end
    prime_factorization(j) + prime_factorization(num/j)
end


#     found = false
#     #while found == false
#     (2..num).each do |factor|
#         debugger
#         if num % factor == 0 && is_prime?(factor)
#             prime_factorization(factor) << prime_factorization(num/factor).pop
#             return
#         end
#     end

# end

def is_prime?(number)
    return false if number < 2

    (2...number).each do |ele|
        if number % ele == 0
            return false
        end
    end
    return true
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]
