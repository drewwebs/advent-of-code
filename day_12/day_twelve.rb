DIRECTIONS = %w[north, south, east, west]

def get_manhattan_distance
    input = File.open('input', 'r')

    dirsHash = Hash.new(0)
    dir = 90

    input.each do |line|
        direction = line[0]
        distance = line[1..-1]
        
        if %w[north, south, east, west].include?(direction)
            %w[north, south].include?(direction) ? dirsHash["netNorth"] += distance : dirsHash["netEast"] += distance
        elsif %[left, right].include?(direction)
            dir == 'left' ? dir -= distance : dir += distance
        else
            dir = direction / 4
            direction = DIRECTIONS[dir]
            case direction
            when 'north'
                dirsHash['netNorth'] += distance
            when 'east'
                dirsHash['netEast'] += distance
            when 'south'
                dirsHash['netNorth'] -= distance
            when 'west'
                dirsHash['netEast'] -= distance
            end
        end
    end
    dirsHash['netNorth'] + dirsHash['netEast']
end

p get_manhattan_distance