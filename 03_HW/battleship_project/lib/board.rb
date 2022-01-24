require 'byebug'

class Board
    attr_reader :size

    def initialize(number)
        @grid = Array.new(number, :N) {Array.new(number, :N)}
        @size = number * number
    end

    def [](arr)
        return @grid[arr[0]][arr[1]]        #can do different syntax --> row, col = position
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships       #used @grid.flatten.count
        count = 0
        @grid.each do |sub|
            sub.each {|subsub| count += 1 if subsub == :S}
        end
        return count
    end

    def attack(position)
        if self.[](position) == :S
            self.[]=(position, :H)
            puts 'you sunk my battleship!'
            return true
        end
        self.[]=(position, :X)
        return false
    end

    def place_random_ships
        #default_s_positions = Array.new([]) {Array.new([])}
        quarter = @size / 4
        count = 0
        length = Math.sqrt(@size)       #can just use @grid.length
        until count == quarter
            new_position = [rand(0...length), rand(0...length)]
            if self.[](new_position) != :S
                self.[]=(new_position, :S)
                count += 1
            end
        end
    end

    def hidden_ships_grid
        length = Math.sqrt(@size)   #again, can just use @grid.length
        new_arr = Array.new(length, 0) {Array.new(length, 0)}
        #debugger
        @grid.each.with_index do |row, idx|         #can use nested .map and not assign a symbol to anything
            row.each.with_index do |column, i|
                if column == :S
                    new_arr[idx][i] = :N
                else
                    new_arr[idx][i] = column
                end
            end
        end
        return new_arr
    end

    def self.print_grid(grid_arr)
        #debugger
        grid_arr.each do |row|      #can just do "row.join(" ")"
            spaced = ""
            row.each do |column|
                spaced << column.to_s
            end
            puts spaced.split("").join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
