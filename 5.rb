# https://adventofcode.com/2017/day/5

require "minitest/autorun"
require "benchmark"

def step(jumplist)
    list = jumplist.split.map(&:to_i)
    head, step = 0, 0
    while instruction = list[head]
        list[head] += 1
        head += instruction
        step += 1
    end
    step
end

def step2(jumplist)
    list = jumplist.split.map(&:to_i)
    head, step = 0, 0
    while instruction = list[head]
        list[head] += instruction >= 3 ? -1 : 1
        head += instruction
        step += 1
    end
    step
end

class DayFiveTests < Minitest::Test
    def setup
        @jumplist = <<eos
        0
        3
        0
        1
        -3
eos
    end
    
    def test_step
        assert_equal(5, step(@jumplist))
    end
    
    def test_step2
        assert_equal(10, step2(@jumplist))
    end
end

Benchmark.bm do |x|
    x.report do
        steps = step(File.read('5.input'))
        puts "Part one completed in #{steps} steps"
    end
    x.report do
        steps = step2(File.read('5.input'))
        puts "Part two completed in #{steps} steps"
    end
end

