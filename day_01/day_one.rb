# --- Day 1: Report Repair ---
# After saving Christmas five years in a row, you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

# The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them stars. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

# To save your vacation, you need to get all fifty stars by December 25th.

# Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

# Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

# Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

# For example, suppose your expense report contained the following:

# 1721
# 979
# 366
# 299
# 675
# 1456
# In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

# Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

# Your puzzle answer was 440979.

# --- Part Two ---
# The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

# Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.

# In your expense report, what is the product of the three entries that sum to 2020?

# Your puzzle answer was 82498112.

# Both parts of this puzzle are complete! They provide two gold stars: **

# At this point, you should return to your Advent calendar and try another puzzle.

# If you still want to see it, you can get your puzzle input.

# You can also [Share] this puzzle.

INPUT = [
    1310,
    1960,
    1530,
    1453,
    1572,
    1355,
    1314,
    1543,
    1439,
    1280,
    1367,
    1368,
    1313,
    1423,
    1771,
    1868,
    1555,
    1635,
    1200,
    2009,
    1649,
    1824,
    1979,
    1523,
    1548,
    1415,
    1371,
    101,
    1836,
    1570,
    1494,
    1850,
    1624,
    1151,
    1408,
    1220,
    1372,
    1871,
    1712,
    1765,
    1950,
    1654,
    1797,
    1814,
    1592,
    1747,
    1566,
    1600,
    1445,
    1297,
    1374,
    1916,
    274,
    1735,
    1392,
    1977,
    1957,
    1672,
    249,
    1980,
    1791,
    1733,
    1962,
    1641,
    1487,
    1486,
    1741,
    1751,
    1309,
    1342,
    1567,
    1353,
    1909,
    1657,
    1837,
    1438,
    1510,
    1811,
    1939,
    1558,
    1215,
    2010,
    1891,
    1929,
    1208,
    1459,
    1272,
    1696,
    1820,
    1206,
    1414,
    1795,
    1884,
    1734,
    1745,
    421,
    1908,
    1986,
    1329,
    932,
    1468,
    1720,
    1769,
    1402,
    1913,
    1580,
    1707,
    1799,
    1185,
    1587,
    1521,
    1428,
    1210,
    1822,
    194,
    1973,
    2000,
    1940,
    1481,
    1509,
    1563,
    1697,
    1924,
    1671,
    1516,
    1758,
    1552,
    1996,
    2002,
    1883,
    1539,
    1089,
    1794,
    1337,
    1875,
    1736,
    1683,
    1682,
    1354,
    1846,
    1427,
    1359,
    1854,
    1574,
    1198,
    359,
    1859,
    1517,
    1706,
    1537,
    1915,
    1983,
    1482,
    1941,
    1703,
    1954,
    1597,
    1903,
    1991,
    53,
    1515,
    1259,
    1421,
    1384,
    1948,
    1776,
    1965,
    1625,
    1478,
    1629,
    1949,
    1144,
    1951,
    1656,
    1137,
    1349,
    1910,
    1483,
    1229,
    1480,
    1324,
    1664,
    1604,
    1764,
    1564,
    1673,
    1686,
    1841,
    1640,
    1627,
    1984,
    1258,
    1376,
    855,
    1413,
    1261,
    1429,
    1863,
    1540,
    692
]

def two_sum(input, target)
    nums = Hash.new
    input.each.with_index do |num, i|
        return  (target-num) * num if nums[target - num]
        nums[num] = i
    end
    return false
end

def three_sum(input, target)
    input.each.with_index do |num, i|
        product = two_sum(input[i+1..-1], target - num)
        return  product * num if product
    end
end