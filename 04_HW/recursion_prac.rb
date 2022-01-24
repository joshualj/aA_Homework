
def sum_to(n)
    return nil if n < 1
    return 1 if n == 1

    n + sum_to(n-1)
end

# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil

def add_numbers(nums_array)
    return nums_array[0] if nums_array.length <= 1
    nums_array[-1] + add_numbers(nums_array[0...-1])
end

# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

def gamma_fnc(n)
    return nil if n < 1
    return 1 if n == 1
    (n-1) * gamma_fnc(n-1)
end

# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
    return flavors[0] == favorite if flavors.length <= 1 || flavors[0] == favorite
    ice_cream_shop(flavors[1..-1], favorite)
end

# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
    return string if string.length <= 1
    reverse(string[1..-1]) + string[0]
end

# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""


def range(num1, num2)
    return [] if num1 > num2
    return [num1, num2] if num2 - num1 == 1
    [num1] + range(num1 + 1, num2)
end

# p range(1,5)
# p range(5,20)

def exp1(b, n)
    return 1 if n == 0
    b * exp1(b, n - 1)
end

# p exp1(2,2)
# p exp1(2,256)

def exp2(base, power)
    return 1 if power == 0
    return base if power == 1
    smaller_exponent = power - 1
    halved_exponent = power / 2
    #base_to_the_smaller_exponent = exponent(base, smaller_exponent)
    if power.even?
        exp2(base, halved_exponent) ** 2 if power.even? #* (exp2(base, (power / 2))) if power.even?
    else
        base * (exp2(base, (smaller_exponent / 2)) ** 2)
    end
end

# p exp2(2,2)
# p exp2(2,256)


def deep_dup(arr)
    return arr if arr.none? {|ele| is_a?(Array)}
    deep_dup(arr[0]) + deep_dup(arr[1..-1])
end

# p deep_dup([1,2,[3,4]])
# p deep_dup([1, [2],[3,[4]]])

def fibonacci(n)
    return [1] if n == 1
    return [1,1] if n == 2
    fibonacci(n - 1) << fibonacci(n - 2)[-1] + fibonacci(n-1)[-1]
end

# p fibonacci(5)

def fibonacci_i(n)
    iterator = 1
    arr = []
    while iterator <= n
        if iterator == 1 || iterator == 2
            arr << 1
        else
            arr << arr[-1] + arr[-2]
        end
        iterator += 1
    end
    return arr
end

# p fibonacci_i(5)
# p fibonacci_i(3)

def bsearch(arr, val)
    return nil if arr.empty? || (arr.length == 1 && arr[0] != val)
    arr.length.odd? ? halfway_idx = (((arr.length + 1) / 2) - 1) : halfway_idx = (arr.length / 2) - 1
    #return halfway_idx
    return halfway_idx if val == arr[halfway_idx]

    if val > arr[halfway_idx]
        #print "#{arr[halfway_idx + 1..-1]} \n"
        sub_answer = bsearch(arr[halfway_idx + 1..-1], val)
        sub_answer.nil? ? nil : halfway_idx + 1 + sub_answer
    else
        bsearch(arr[0..halfway_idx], val)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def quick_sort(arr)         #not assigned
    return arr if arr.length <= 1

    pivot = arr.first
    left = arr.drop(1).select {|ele| ele < pivot}
    right = arr.drop(1).select {|ele| ele >= pivot}

    quick_sort(left) + [pivot] + quick_sort(right)
end

#p quick_sort([1,4,2,5])

def merge_sort(arr)
    return arr if arr.length <= 1
    arr.length.odd? ? halfway_idx = (((arr.length + 1) / 2) - 1) : halfway_idx = (arr.length / 2) - 1

    marge(merge_sort(arr[0..halfway_idx]), merge_sort(arr[halfway_idx + 1..-1]))
end

def marge(arr, arr2)
    new_arr = arr.dup
    new_arr2 = arr2.dup
    new_new = []
    print "#{new_arr} \n"
    print "#{new_arr2} \n"

    until new_arr.empty?
        if new_arr2.empty?
            new_new << new_arr
            new_arr = []
        elsif new_arr[0] > new_arr2[0]
            new_new << new_arr2[0]
            new_arr2 = new_arr2[1..-1]
        else
            new_new << new_arr[0]
            new_arr = new_arr[1..-1]
        end
    end

    if !new_arr2.empty?
        new_new = new_new + new_arr2
    end
    return new_new
end

#p merge_sort([1,4,2,5,100,56,89,88,84,86,85])


def subsets(arr)
    return [arr] if arr.length == 0
    pivot = [arr.last]
    subsets(arr[0...-1]) + [pivot] #+ [arr]
    # (0...arr.length).each do |first|
    #     (first...arr.length).each do |second|
    #         array_subsets()
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]


def greedy_make_change(amount, coins)
    if coins.include?(amount)
        return [coins.find {|coin| coin == amount}]
    end

    biggest_coin = coins.find {|coin| coin <= amount}
    difference = amount - biggest_coin
    sub_cases = greedy_make_change(difference, coins.reject {|coin| coin > amount})
    [biggest_coin] + sub_cases
end

p greedy_make_change(24,[10,7,1])

def make_better_change(amount, coins)
    return [coins.find {|coin| coin == amount}] if coins.include?(amount)

    permutations = []
    initial_best = greedy_make_change(amount, coins.reject {|coin| coin > amount})
    current_change = []
    coins.each do |coin|



    return current_best if current_best.length < initial_best.length
end
