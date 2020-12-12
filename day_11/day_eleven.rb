require 'byebug'

class Array
    def deep_dup
        self.map { |ele| ele.is_a?(Array) ? ele.dup : ele }
    end
end

def sit_down?(chart, seat_index)
    row, seat = seat_index
    left = (seat - 1 >= 0) ? (chart.dig(row, seat-1)) : "."
    right = chart.dig(row, seat+1) || "."
    down = chart.dig(row+1, seat) || "."
    up = (row - 1 >= 0) ? (chart.dig(row-1, seat)) : "."
    diag_down_right = chart.dig(row+1, seat+1) || "."
    diag_up_right = (row - 1 >= 0) ? chart.dig(row-1, seat+1) || "." : "."
    diag_down_left = (seat - 1 >= 0) ? chart.dig(row+1, seat-1) || "." : "."
    diag_up_left = (seat - 1 >= 0 && row-1 >= 0) ? chart.dig(row-1, seat-1) : "."

    dirs = [left, right, down, up, diag_down_left, diag_down_right, diag_up_left, diag_up_right]
    
    return dirs.none? { |dir| dir == "#" }
end

def leave_seat?(chart, seat_index)
    row, seat = seat_index
    num_adjacent = 0

    left = (seat - 1 >= 0) ? (chart.dig(row, seat-1)) : "."
    right = chart.dig(row, seat+1) || "."
    down = chart.dig(row+1, seat) || "."
    up = (row - 1 >= 0) ? (chart.dig(row-1, seat)) : "."
    diag_down_right = chart.dig(row+1, seat+1) || "."
    diag_up_right = (row - 1 >= 0) ? chart.dig(row-1, seat+1) || "." : "."
    diag_down_left = (seat - 1 >= 0) ? chart.dig(row+1, seat-1) || "." : "."
    diag_up_left = (seat - 1 >= 0 && row-1 >= 0) ? chart.dig(row-1, seat-1) : "."

    dirs = [left, right, down, up, diag_down_left, diag_down_right, diag_up_left, diag_up_right]

    dirs.each { |dir| num_adjacent +=1 if dir == "#"}

    return num_adjacent >= 4
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
