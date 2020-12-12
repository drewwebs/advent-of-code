require 'byebug'

class Array
    def deep_dup
        self.map { |ele| ele.is_a?(Array) ? ele.dup : ele }
    end
end

def get_left(chart, row, col)
    return nil if col < 0
    val = (col - 1 >= 0) ? (chart.dig(row, col-1)) : nil
    return get_left(chart, row, col - 1) if val == "."
    val
end

def get_right(chart, row, col)
    return nil if col >= chart[0].length
    val = chart.dig(row, col+1) || nil
    return get_right(chart, row, col + 1) if val == "."
    val
end

def get_up(chart, row, col)
    return nil if row < 0
    val = (row - 1 >= 0) ? (chart.dig(row-1, col)) : nil
    return get_up(chart, row-1, col) if val == "."
    val
end

def get_down(chart, row, col)
    return nil if row >= chart[0].length
    val = chart.dig(row+1, col) || nil
    return get_down(chart, row+1, col) if val == "."
    val
end

def get_up_left(chart, row, col)
    return nil if row < 0 || col < 0
    val = (col - 1 >= 0 && row-1 >= 0) ? chart.dig(row-1, col-1) : nil
    return get_up_left(chart, row-1, col-1) if val == "."
    val
end

def get_up_right(chart, row, col)
    return nil if row < 0 || col >= chart[0].length
    val = (row - 1 >= 0) ? chart.dig(row-1, col+1) || nil : nil
    return get_up_right(chart, row-1, col+1) if val == "."
    val
end

def get_down_right(chart, row, col)
    return nil if row >= chart[0].length|| col >= chart[0].length
    val = chart.dig(row+1, col+1) || nil
    return get_down_right(chart, row+1, col+1) if val == "."
    val
end

def get_down_left(chart, row, col)
    return nil if row >= chart[0].length|| col < 0
    val = (col - 1 >= 0) ? chart.dig(row+1, col-1) || nil : nil
    return get_down_left(chart, row+1, col-1) if val == "."
    val
end

def sit_down?(chart, seat_index)
    row, col = seat_index
    
    left = get_left(chart, row, col)
    right = get_right(chart, row, col)
    down = get_down(chart, row, col)
    up = get_up(chart, row, col)
    diag_down_right = get_down_right(chart, row, col)
    diag_up_right = get_up_right(chart, row, col)
    diag_down_left = get_down_left(chart, row, col)
    diag_up_left = get_up_left(chart, row, col)

    dirs = [left, right, down, up, diag_down_left, diag_down_right, diag_up_left, diag_up_right]
    
    return dirs.none? { |dir| dir == "#" }
end

def leave_seat?(chart, seat_index)
    row, col = seat_index
    num_adjacent = 0

    left = get_left(chart, row, col)
    right = get_right(chart, row, col)
    down = get_down(chart, row, col)
    up = get_up(chart, row, col)
    diag_down_right = get_down_right(chart, row, col)
    diag_up_right = get_up_right(chart, row, col)
    diag_down_left = get_down_left(chart, row, col)
    diag_up_left = get_up_left(chart, row, col)

    dirs = [left, right, down, up, diag_down_left, diag_down_right, diag_up_left, diag_up_right]

    dirs.each { |dir| num_adjacent +=1 if dir == "#"}

    return num_adjacent >= 5
end

def get_seat_layout
    input = File.open("input", 'r')

    seating_chart = []
    input.each do |line|
        seating_chart.push(line.chomp.split(""))
    end

    stable = false

    while stable == false
        stable = true
        next_chart = seating_chart.deep_dup
        seating_chart.each_with_index do |row, i|
            row.each_with_index do |seat, j|
                next if seat == "."
                case
                when seat == "L" && sit_down?(seating_chart, [i, j])
                    next_chart[i][j] = "#"
                    stable = false
                when seat == "#" && leave_seat?(seating_chart, [i, j])
                    next_chart[i][j] = "L"
                    stable = false
                end
            end
        end
        seating_chart = next_chart
    end

    num_sitting = 0

    seating_chart.each do |row|
        num_sitting += row.select { |seat| seat == "#" }.length
    end
    
    num_sitting
end

p get_seat_layout
