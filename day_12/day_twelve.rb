DIRECTIONS = %w[N E S W]
require 'byebug'

def get_manhattan_distance
    input = File.open('input', 'r')

    dirsHash = Hash.new(0)
    dir = 90

    input.each do |line|
        direction = line[0]
        distance = line[1..-1].to_i

        if DIRECTIONS.include?(direction)
            case direction
            when 'N'
                dirsHash['netNorth'] += distance
            when 'E'
                dirsHash['netEast'] += distance
            when 'S'
                dirsHash['netNorth'] -= distance
            when 'W'
                dirsHash['netEast'] -= distance
            end
        elsif %[L R].include?(direction)
            direction == 'L' ? dir -= distance : dir += distance
        else
            directionIndex = (dir / 90) % 4
            direction = DIRECTIONS[directionIndex]
            
            case direction
            when 'N'
                dirsHash['netNorth'] += distance
            when 'E'
                dirsHash['netEast'] += distance
            when 'S'
                dirsHash['netNorth'] -= distance
            when 'W'
                dirsHash['netEast'] -= distance
            end
        end
    end
    dirsHash['netNorth'].abs() + dirsHash['netEast'].abs()
end

p get_manhattan_distance