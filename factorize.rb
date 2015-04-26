

def factorize(num, factors)
  even = false
  prime = true
  if num % 2 == 0
    even = true
    prime = false
    new_number = num/2
    factors[2] = 0 if !factors[2]
    factors[2] += 1
    factors = factorize(new_number,factors) if new_number >= 2
  end
  if even == false
    (3..num/2).step(2).each do |divisor|
      # puts "#{num} #{divisor}"
      if num % divisor == 0
        prime = false
        factors[divisor] = 0 if factors[divisor] == nil
        factors[divisor] += 1
        new_number = num/divisor
        # puts "new number #{new_number}"
        # puts "factor b: #{divisor} #{new_number}"
        factors = factorize(new_number,factors)
        break
      end
    end
    if prime
      if !factors[num]
        factors[num] = 1
      else
        factors[num] += 1
      end
    end
  end
  factors
end

num = ARGV[0].to_i
factors = factorize(num, {})
puts factors

result = 1
factors.each do |key, val|
  partial = key ** val
  result = result * (partial)
  puts "#{key}^#{val} | #{partial} | #{result}"
end

if result != ARGV[0].to_i
  puts ARGV[0]
  puts factors
  puts result
  puts
  puts
end
