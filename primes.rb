
#get args
ini = ARGV[0].to_i
fin = ARGV[1].to_i
ini = ini*(-1) if ini < 0
fin = fin*(-1) if fin < 0
if fin < ini
  swap = ini
  ini = fin
  fin = swap
end

if ini <= 1
  ini = 2
end

primes = []
if ini <= 3
  primes << 2
end


def is_prime num_to_check
  max_number = Math::sqrt(num_to_check).round()
  # max_number += 1 if max_number % 2 == 0
  prime = even = (num_to_check % 2 == 0)
  if(!even)
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


# puts "primes #{ini} #{fin}"
ini+=1 if ini % 2 == 0
(ini..fin).step(2).each do |num_to_check|
  primes << num_to_check if is_prime num_to_check
end
puts primes
