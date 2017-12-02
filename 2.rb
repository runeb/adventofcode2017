# https://adventofcode.com/2017/day/2

require "minitest/autorun"

def checksum(rows)
    rows.each_line.inject(0) do |mem, row|
        numbers = row.split.map(&:to_i)
        mem += numbers.max - numbers.min
        mem
    end
end

def evensums(rows)
    rows.each_line.inject(0) do |mem, row|
        numbers = row.split.map(&:to_i)
        pair = numbers.sort.combination(2).reject do |pair|
            pair[1] % pair[0] != 0
        end.first
        mem += pair[1] / pair[0]
        mem
    end
end

class DayTwoTests < Minitest::Test
    def test_checksum
        data = <<eos
        5 1 9 5
        7 5 3
        2 4 6 8
eos
        assert_equal(18, checksum(data))
    end
    
    def test_evensums
        data = <<eos
        5 9 2 8
        9 4 7 3
        3 8 6 5
eos
        assert_equal(9, evensums(data))
    end
end

if ARGV[0] != nil
    File.open(ARGV[0]) do |file|
        data = file.read
        puts "The answer to part 1 is #{checksum(data)}"
        puts "The answer to part 2 is #{evensums(data)}"
    end
end
