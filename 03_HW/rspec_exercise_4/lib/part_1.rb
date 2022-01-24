require 'byebug'

def my_reject(arr, &prc)
    return arr.select {|ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
    new_arr = arr.select{|ele| prc.call(ele)}
    return new_arr.length == 1
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each {|k, v| new_hash[k] = v if prc.call(k,v)}
    return new_hash
end

def xor_select(arr, prc, prc2)
    return arr.select {|ele| (prc.call(ele) || prc2.call(ele)) && !(prc.call(ele) && prc2.call(ele))}
end

def proc_count(val, arr)
    count = 0
    arr.each {|prc| count += 1 if prc.call(val)}            #can just do arr.count {|arr| prc.call(val)}
    return count
end

def proper_factors(num)
    (1...num).select {|fact| num % fact == 0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    return num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []
    i = 1
    until arr.length == n
        arr << i if perfect_number?(i)
        i += 1
    end
    return arr
end
