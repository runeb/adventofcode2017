# https://adventofcode.com/2017/day/3

require "minitest/autorun"

def manhattan_distance(memory_location)
    return 0 if memory_location == 1
    
    num = ((Math.sqrt(memory_location)).ceil / 2).floor
    offset = (memory_location - (2 * num - 1) ** 2) % (2 * num)
    return num + (offset - num).abs
end

class DayThreeTests < Minitest::Test
    def test_manhattan_distance
        assert_equal(0, manhattan_distance(1))
        assert_equal(3, manhattan_distance(12))
        assert_equal(2, manhattan_distance(23))
        assert_equal(31, manhattan_distance(1024))
    end
end

puts "The answer is #{manhattan_distance(347991)}"
