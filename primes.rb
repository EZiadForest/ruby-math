$LOAD_PATH << '.'

require 'functions.rb'

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

primes = Primes::Prime.new

prime_numbers = []
if ini <= 3
  prime_numbers << 2
end


# puts "primes #{ini} #{fin}"
ini+=1 if ini % 2 == 0
(ini..fin).step(2).each do |num_to_check|
  prime_numbers << num_to_check if primes.is_prime num_to_check
end
puts prime_numbers
