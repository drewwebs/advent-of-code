require 'byebug'

def find_joltage_product
    input = File.open('input', 'r')
    joltages = []

    input.each do |line|
        joltages.push(line.chomp.to_i)
    end

    joltages.sort!.unshift(0)
    diff_ones = 0
    diff_threes = 1

    joltages.each_with_index do |joltage, i|
        break if i == joltages.length - 1
        diffy = joltages[i+1] - joltage
        diff_ones += 1 if diffy == 1
        diff_threes += 1 if diffy == 3
        p "can't connect!" if diffy > 3
    end
    diff_ones * diff_threes
end

p find_joltage_product

def find_joltage_permutations
    input = File.open('input', 'r')
    joltages = []

    input.each do |line|
        joltages.push(line.chomp.to_i)
    end

    joltages.sort!.unshift(0)
    
    dig_the_tree(joltages, cache={})
end

def dig_the_tree(joltages, cache)
    return cache[joltages] if cache[joltages]
    permutations = 1
    joltages.each_with_index do |joltage, i|
        if joltages[i + 2] && joltages[i + 2] - joltage <= 3
            permutations += dig_the_tree([joltages[i]] + joltages[i+2..-1], cache)
            cache[joltages] = permutations
        end
    end
    permutations
end

p find_joltage_permutations