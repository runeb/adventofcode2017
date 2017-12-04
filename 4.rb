# https://adventofcode.com/2017/day/4

require "minitest/autorun"

def valid_passphrase?(passphrase)
    passphrase.split.count == passphrase.split.uniq.count
end

def valid_passphrase2?(passphrase)
    sorted = passphrase.split.map {|word| word.chars.sort.join}
    sorted.count == sorted.uniq.count
end

class DayFourTests < Minitest::Test
    def test_valid_passphrase?
        assert(valid_passphrase?("aa bb cc dd ee"))
        assert(!valid_passphrase?("aa bb cc dd aa"))
        assert(valid_passphrase?("aa bb cc dd aaa"))
    end
    
    def test_valid_passphrase2?
        assert(valid_passphrase2?("abcde fghij"))
        assert(!valid_passphrase2?("abcde xyz ecdab"))
        assert(valid_passphrase2?("a ab abc abd abf abj"))
        assert(valid_passphrase2?("iiii oiii ooii oooi oooo"))
        assert(!valid_passphrase2?("oiii ioii iioi iiio"))
    end
end

if File.exist?("4.input")
    File.open("4.input") do |file|
        
        part1 = 0
        part2 = 0
        file.each_line do |passphrase|
            part1 += 1 if valid_passphrase?(passphrase)
            part2 += 1 if valid_passphrase2?(passphrase)
        end
        puts "#{part1} valid passphrases"
        puts "#{part2} valid stronger passphrases"
    end
end
