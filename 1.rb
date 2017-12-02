# https://adventofcode.com/2017/day/1

require "minitest/autorun"

def captcha(number, step = 1)
    chars = number.to_s.chars
    chars.each_with_index.inject(0) do |mem, (i, idx)|
        mem += i.to_i if chars[(idx + step) % chars.count] == i
        mem
    end
end

class DayOneTests < Minitest::Test
    def test_part1
        assert_equal(3, captcha(1122))
        assert_equal(4, captcha(1111))
        assert_equal(0, captcha(1234))
        assert_equal(9, captcha(91212129))
    end
    
    def test_part2
        assert_equal(6, captcha(1212, "1212".chars.count / 2))
        assert_equal(0, captcha(1221, "1221".chars.count / 2))
        assert_equal(4, captcha(123425, "123425".chars.count / 2))
        assert_equal(12, captcha(123123, "123123".chars.count / 2))
        assert_equal(4, captcha(12131415, "12131415".chars.count / 2))
    end
end
