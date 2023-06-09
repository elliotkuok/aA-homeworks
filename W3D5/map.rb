class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key, value]
    end

    def get(key)
        @map.each {|pair| return pair[1] if pair[0] == key}
    end

    def delete(key)
        @map.each {|pair| @map.delete(pair) if pair[0] == key}
    end

    def show
        @map.each {|pair| puts pair[0] => pair[1]}
    end
endcleaw