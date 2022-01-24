require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each {|room_name, capacity| @rooms[room_name] = Room.new(capacity)}
    end

    def name
        names = @name.split(" ")
        new_arr = []
        names.each {|name| new_arr << name.capitalize}
        return new_arr.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        return @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each do |room, v|
            return true if !v.full?
        end
        return false
    end

    def list_rooms
        @rooms.each do |room, v|
            puts "#{room} : #{v.available_space.to_s}"
        end
    end
end
