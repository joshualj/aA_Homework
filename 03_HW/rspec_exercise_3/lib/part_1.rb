require 'byebug'

def is_prime?(num)
    return false if num < 2

    (2...num).each do |ber|
        return false if num % ber == 0
    end
    return true
end

def nth_prime(n)
    arr = []
    i = 2
    until arr.length == n
        arr << i if (2...i).none? {|num| i % num == 0}  #could have just put if is_prime?(i)
        i += 1
    end
    return arr[-1]
end

def prime_range(min, max)
    return [] if max < 2
    return (min..max).select {|num| (2...num).none? {|ele| num % ele == 0}} #again, could have just used is_prime?(num)
end

def element_count(arr)
    count = Hash.new(0)
    arr.each {|ele| count[ele] += 1}
    return count
end

def char_replace!(str, hash)
    return str.each_char.with_index {|char, i| str[i] = hash[char] if hash.keys.include?(char)}
end

def product_inject(nums)
    nums.inject {|product, n| product * n}
end
