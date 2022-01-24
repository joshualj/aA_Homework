# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  return 0 if num == 0
  if num < 0
    negative_half = (num...0).select {|factor| num % factor == 0}
    positive_half = (1..-num).select {|factor| num % factor == 0}
    return negative_half + positive_half
  else
    return (1..num).select {|factor| num % factor == 0} if num > 0
  end
end

# p factors(2) # => [1,2]
# p factors(1) # => [1]
# p factors(-30) # [1,2,3,5,6,10,15,30]
# p factors(-5) #[-5, -1, 1, 5]
# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    sorted = false
    while sorted == false
      sorted = true
      (0...self.length - 1).each do |idx|
        if (prc.call(self[idx], self[idx + 1])) == 1
        #if (prc.call(self[idx]) <=> prc.call(self[idx + 1])) == 1
          self[idx], self[idx+1] = self[idx+1], self[idx]
          sorted = false
        end
      end
    end
  return self
  end

  def bubble_sort(&prc)
    not_og = self.dup
    not_og.bubble_sort!(&prc)
  end
end

# p [1,5,4, 2, 3, 50, 35, 90, 1000, 10000000, 1242334].bubble_sort! {|x| x*2}
# p [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# p [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
#p ["yep","yepppp","yeppp", "yepp"].bubble_sort!

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  new_str = []
  (0...string.length).each do |idx|
    (idx...string.length).each do |i|
      new_str << string[idx..i]
    end
  end
  return new_str
end

def subwords(word, dictionary)
  blah = []
  substrings(word).each {|substring| blah << substring if dictionary.include?(substring) && !blah.include?(substring)}
  blah
end

p subwords("cat", ["cat", "at"])  # => cat, at
p subwords("concatenate", ["co", "con", "cat", "ten", "ate"])
p substrings("bar") # => ['b', 'ba', 'bar', 'a', 'ar', 'r']

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
end

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

class Array
  def my_each(&prc)
  end
end

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
  def my_map(&prc)
  end

  def my_select(&prc)
  end

  def my_inject(&blk)
  end
end

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
end
