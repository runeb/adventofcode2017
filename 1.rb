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
        assert_equal(captcha(1122), 3)
        assert_equal(captcha(1111), 4)
        assert_equal(captcha(1234), 0)
        assert_equal(captcha(91212129), 9)
    end
    
    def test_part2
        assert_equal(captcha(1212, "1212".chars.count / 2), 6)
        assert_equal(captcha(1221, "1221".chars.count / 2), 0)
        assert_equal(captcha(123425, "123425".chars.count / 2), 4)
        assert_equal(captcha(123123, "123123".chars.count / 2), 12)
        assert_equal(captcha(12131415, "12131415".chars.count / 2), 4)
    end
end
