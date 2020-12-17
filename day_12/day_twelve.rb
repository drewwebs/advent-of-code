DIRECTIONS = %w[N E S W]
require 'byebug'
require './ship'
require './waypoint'

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



waypoint = Waypoint.new({'N' => 1, 'E' => 10, 'W' => 0, 'S' => 0})
ship = Ship.new

def get_manhattan_distance_2(ship, waypoint)
        input = File.open('input', 'r')
        input.each do |line|
        direction = line[0]
        distance = line[1..-1].to_i

        if DIRECTIONS.include?(direction)
            waypoint.move(direction, distance)
        elsif %[L R].include?(direction)
            direction == 'L' ? waypoint.rotate_left(distance) : waypoint.rotate_right(distance)
        else
            ship.move(distance, waypoint)
        end
    end

    ship.manhattan_distance
end

p get_manhattan_distance_2(ship, waypoint)