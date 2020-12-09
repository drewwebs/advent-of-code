# Advent of Code[About][Events][Shop][Settings][Log Out]Drew 12*
#   {:year 2020}[Calendar][AoC++][Sponsors][Leaderboard][Stats]
# Our sponsors help make Advent of Code possible:
# GitHub - We're hiring engineers to make GitHub fast. Interested? Email fast@github.com with details of exceptional performance work you've done in the past.
# --- Day 7: Handy Haversacks ---
# You land at the regional airport in time for your next flight. In fact, it looks like you'll even have time to grab some food: all flights are currently delayed due to issues in luggage processing.

# Due to recent aviation regulations, many rules (your puzzle input) are being enforced about bags and their contents; bags must be color-coded and must contain specific quantities of other color-coded bags. Apparently, nobody responsible for these regulations considered how long they would take to enforce!

# For example, consider the following rules:

# light red bags contain 1 bright white bag, 2 muted yellow bags.
# dark orange bags contain 3 bright white bags, 4 muted yellow bags.
# bright white bags contain 1 shiny gold bag.
# muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
# shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
# dark olive bags contain 3 faded blue bags, 4 dotted black bags.
# vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
# faded blue bags contain no other bags.
# dotted black bags contain no other bags.
# These rules specify the required contents for 9 bag types. In this example, every faded blue bag is empty, every vibrant plum bag contains 11 bags (5 faded blue and 6 dotted black), and so on.

# You have a shiny gold bag. If you wanted to carry it in at least one other bag, how many different bag colors would be valid for the outermost bag? (In other words: how many colors can, eventually, contain at least one shiny gold bag?)

# In the above rules, the following options would be available to you:

# A bright white bag, which can hold your shiny gold bag directly.
# A muted yellow bag, which can hold your shiny gold bag directly, plus some other bags.
# A dark orange bag, which can hold bright white and muted yellow bags, either of which could then hold your shiny gold bag.
# A light red bag, which can hold bright white and muted yellow bags, either of which could then hold your shiny gold bag.
# So, in this example, the number of bag colors that can eventually contain at least one shiny gold bag is 4.

# How many bag colors can eventually contain at least one shiny gold bag? (The list of rules is quite long; make sure you get all of it.)

# To begin, get your puzzle input.

# Answer: 
 

# You can also [Share] this puzzle.
require 'byebug'



def calc_num_bags(bag_color, checked_colors=[])
    return [] if checked_colors.include?(bag_color)
    input = File.open('input', 'r')
    container_colors = []
    checked_colors.push(bag_color)
    
    input.each do |line|
        container_color = "#{line.split(" ")[0]} #{line.split(" ")[1]}"
        if line.include?(bag_color) && container_color != bag_color && !container_colors.include?(container_color)
            container_colors.push(container_color)
            container_colors.concat(calc_num_bags(container_color, checked_colors))
        end
    end

    container_colors.uniq
end

p calc_num_bags("shiny gold", []).length

def calc_inner_bags(bag_color)
    count = 0
    return 0 if bag_color == "no other"

    input = File.open('input', 'r')

    input.each do |line|
        container_color = "#{line.split(" ")[0]} #{line.split(" ")[1]}"
        if container_color == bag_color
            contents = line.split("contain")[1].split(" ")
            contents.each.with_index do |word, i|
                if word.include?("bag")
                    quantity = contents[i - 3]
                    color = "#{contents[i - 2]} #{contents[i - 1]}"
                    quantity = quantity.to_i.to_s == quantity ? quantity.to_i : 0
                    count += quantity + quantity * calc_inner_bags(color)
                end
            end
        end
    end
    count
end

p calc_inner_bags("shiny gold")