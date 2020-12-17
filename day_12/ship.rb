
class Ship
    attr_accessor :location

    def initialize
        @location = {'N'=> 0, 'S'=> 0, 'E'=> 0, 'W'=> 0}
    end


    def move(num, waypoint)
        waypoint.dirs.each { |dir, dis| self.location[dir] += dis * num }
    end

    def manhattan_distance
        (self.location['N'] - self.location['S']).abs + (self.location['E'] - self.location['W']).abs 
    end
end
