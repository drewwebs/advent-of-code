class Waypoint
    attr_accessor :dirs

    def initialize(dirs)
        @dirs = dirs
    end

    def move(direction, distance)
        self.dirs[direction] += distance
    end

    def rotate_right(degrees)
        num_times = degrees / 90
        num_times.times do
            new_dir = Hash.new
            self.dirs.each do |dir, dis|
                case dir
                when 'N'
                    new_dir['E'] = dis
                when 'E'
                    new_dir['S'] = dis
                when 'S'
                    new_dir['W'] = dis
                when 'W'
                    new_dir['N'] = dis
                end
            end
            self.dirs = new_dir
        end
    end

    def rotate_left(degrees)
        num_times = degrees / 90
        num_times.times do
            new_dir = Hash.new
            self.dirs.each do |dir, dis|
                case dir
                when 'N'
                    new_dir['W'] = dis
                when 'E'
                    new_dir['N'] = dis
                when 'S'
                    new_dir['E'] = dis
                when 'W'
                    new_dir['S'] = dis
                end
            end
            self.dirs = new_dir
        end
    end
end