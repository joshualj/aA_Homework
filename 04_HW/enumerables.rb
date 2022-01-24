class Array
    def my_each(&blk)
        #self.map {|ele| blk.call(ele)}
        iterator = 0
        while iterator < self.length
            blk.call(self[iterator])
            iterator += 1
        end
        return self
    end

    def my_select(&blk)
        #self.my_each(blk) {|ele| ele if blk.call(ele)}
        self.my_each(&blk).select {|ele| blk.call(ele)}
    end

    def my_reject(&blk)
        self.my_each(&blk).select {|ele| !blk.call(ele)}
    end

    def my_any?(&blk)
        #self.any? {|ele| blk.call(ele)}
        self.my_each {|ele| return true if blk.call(ele)}
        return false
    end

    def my_all?(&blk)
        #self.all? {|ele| blk.call(ele)}
        self.my_each {|ele| return false if !blk.call(ele)}
        return true
    end

    def my_flatten
        return self if self.none? {|ele| ele.kind_of?(Array)}
        iterator = 0
        until self[iterator].kind_of?(Array)        #can also use self[iterator].is_a?(Array)
            iterator += 1
        end
        new_task = self[0...iterator] + self[iterator] + self[iterator + 1..-1]
        new_task.my_flatten
    end

    def my_zip(*args)
        #zip?
        self.zip(*args)

        # outer_arr = []
        # target_size = args.count + 1

        # args_iterator = 0
        # until outer_arr.size == self.length
        #     inner_arr = [self[args_iterator]]
        #     until inner_arr.size == target_size
        #         args.each do |arg|
        #             inner_arr << arg[args_iterator] if inner_arr.length < target_size
        #         end
        #         difference_in_size = target_size - inner_arr.length
        #         difference_in_size.times {inner_arr << nil if difference_in_size > 0}
        #         outer_arr << inner_arr
        #     end
        #     args_iterator += 1
        # end
        # return outer_arr
    end


    def my_rotate(num= 1)
        self.rotate(num)
    end

    def my_join(separator= "")
        #self.join(separator)
        join = ""
        self.length.times do |i|
            join += self[i]
            join += separator unless i == self.length - 1
        end
        join
    end

    def my_reverse
        rev_arr = []

        self.length.times do |i|
            rev_arr.unshift(self[i])
        end

        rev_arr
    end
end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
