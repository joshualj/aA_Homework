class Player
    def get_move
        puts  "enter a position with coordinates separated with a space like '4 7'"
        response = gets.chomp.split     #can just do gets.chomp.split(" ").map(&:to_i)
        new_arr = []
        response.each {|ele| new_arr << ele.to_i}
        return new_arr
    end
end
