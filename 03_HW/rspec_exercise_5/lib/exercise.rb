require 'byebug'

def zip(*arr)
    new_arr = Array.new(arr[0].length) {Array.new(arr.length)}
    arr.each.with_index do |array, idx|
        array.each.with_index {|ele, i| new_arr[i][idx] = ele}
    end
    new_arr
end

def prizz_proc(arr, prc, prc2)
    arr.select {|ele| (prc.call(ele) || prc2.call(ele)) && !(prc.call(ele) && prc2.call(ele))}
end

def zany_zip(*arrs)
    longest_arr = arrs.max_by(&:length)
    new_arr = Array.new(longest_arr.length) {Array.new(arrs.length)}
    arrs.each.with_index do |array, idx|
        array.each.with_index {|ele, i| new_arr[i][idx] = ele}
    end
    new_arr
end

def maximum (arr, &prc)
    arr.inject do |acc, el|
        if prc.call(el) >= prc.call(acc)
            el
        else
            acc
        end
    end
end

def my_group_by(arr, &prc)
    hash = Hash.new {|h,k| h[k] = []}
    arr.each {|ele| hash[prc.call(ele)] << ele}
    return hash
end

def max_tie_breaker(arr, prc, &prc1)
    return nil if arr.length == 0

    new_hash = Hash.new {|h, k| h[k] = 0}
    arr.each {|ele| new_hash[ele] = prc1.call(ele)}
    new_hash = new_hash.sort_by {|k, v| v}.to_h
    maximum_pairs = new_hash.select {|k, v| new_hash[k] == new_hash[new_hash.keys[-1]]}.to_h
    if maximum_pairs.size == 1
        return new_hash.keys[-1]
    end

    tie_breaker_1 = Hash.new {|h, k| h[k] = 0}
    maximum_pairs.keys.each {|key| tie_breaker_1[key] = prc.call(key)}
    tie_breaker_1 = tie_breaker_1.sort_by {|k,v| v}.to_h
    max_breaker = tie_breaker_1.select {|k,v| tie_breaker_1[k] == tie_breaker_1[tie_breaker_1.keys[-1]]}
    return tie_breaker_1.keys[-1] if max_breaker.size == 1

    arr.each do |ele|
        return ele if max_breaker.has_key?(ele)
    end
end

def silly_syllables(sentence)               #can create an array of vowel indices, then use array.first and array.last to refer to the first and last elements in that list
    vowels = "aeiouAEIOU"
    words = sentence.split
    words.each.with_index do |word, idx|
        if !word.each_char.one? {|char| vowels.include?(char)} && !word.each_char.none? {|ele| vowels.include?(ele)}
            left_idx = 0
            left_vowel_found = false
            until left_vowel_found == true
                if vowels.include?(word[left_idx])
                    new_right_part = word[left_idx...word.length]
                    left_vowel_found = true
                end
                left_idx += 1
            end

            right_idx = new_right_part.length - 1
            right_vowel_found = false
            until right_vowel_found == true
                if vowels.include?(new_right_part[right_idx])
                    new_left_part = new_right_part[0..right_idx]
                    right_vowel_found = true
                end
                right_idx -= 1
            end
            words[idx] = new_left_part
        end
    end
    return words.join(" ")
end
