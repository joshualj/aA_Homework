# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"

class Array
    def span
        return nil if self.length == 0
        return self.max - self.min
    end

    def average
        return nil if self.length == 0
        return self.sum * 1.0 / self.length
    end

    def median
        return nil if self.length == 0
        if self.count.odd?
            return self.sort[self.length / 2]
        else
            return (self.sort[(self.length / 2) - 1] + self.sort[self.length / 2]) / 2.0
        end
    end

    def counts
        new_hash = Hash.new(0)
        self.each {|ele| new_hash[ele] += 1 }
        return new_hash
    end

    def my_count(str)
        count = 0
        self.each {|ele| count += 1 if ele == str}
        return count
    end

    def my_index(str)
        self.each.with_index {|ele, i| return i if str == ele}
        return nil
    end

    def my_uniq
        new_arr = []
        self.each {|ele| new_arr << ele if !new_arr.include?(ele)}
        return new_arr
    end

    def my_transpose
        new_arr = Array.new(self.length) {Array.new(0)}
        self.each.with do |subarray|
            subarray.each.with_index { |ele, i| new_arr[i] << ele}
        end
        return new_arr
    end
end
