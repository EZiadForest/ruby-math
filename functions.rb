
module Primes
  class Prime
    def generate( ini, fin)
      puts ini
    end

    def n6(ini, fin)
      serie = []
      index = (ini-1)*2
      (ini..fin).each do |num|
        tmp = 6*num
        serie << [index, tmp-1]
        index+=1
        serie << [index, tmp+1]
        index+=1
      end
      serie
    end

    def print_naturals(max)
      index = 0
      (4..max).each do |num|
        index += 1
        if index == 6
          index = 0
          puts
        elsif index == 2 || index == 4
          print "|%4s|".center(10) % "#{num}"

        else
          print "%10s" % "#{num} ".center(10)

        end
      end
    end

    def is_prime_odds num_to_check
      max_number = Math::sqrt(num_to_check)
      # max_number += 1 if max_number % 2 == 0
      prime = div2 = (num_to_check % 2 == 0)
      if(!div2)
        prime = true
        (3..max_number).step(2).each do |divisor|
          divisible = num_to_check % divisor
          if divisible == 0
            prime = false
          end
          break if !prime
        end
      end
      prime
    end

    def is_prime num_to_check
      # puts
      # puts "#{num_to_check}............"
      max_number = Math::sqrt(num_to_check).round()
      divisors = []
      divisors << 2
      divisors << 3 if num_to_check > 3
      prime = true
      divisors.each do |divisor|
        rest = num_to_check % divisor
        if rest == 0
          prime = false
        end
      end

      if prime
        #divide by 6n-1 and 6n+1
        (5..max_number).step(6).each do |divisor|
          rest = num_to_check % divisor
          if rest == 0
            prime = false
            break
          end
          rest = num_to_check % (divisor+2)
          if rest == 0
            prime = false
            break
          end
        end
      end

      prime
    end
  end
end
