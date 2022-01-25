class Map

    def initialize
        @map = []
    end

    def set(key, value)
        if @map.any? {|pair| pair[0] == key}
            @map.each {|pair| pair[1] = value if pair[0] == key}
        else
            @map << [key, value]
        end
    end

    def get(key)
        @map.find {|pair| pair[0] == key}
    end

    def delete(key)
        @map.reject! {|pair| pair[0] == key}
    end

    def show
        @map
    end

    private

    attr_reader :map

end
