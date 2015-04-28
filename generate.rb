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

primes = Primes::Prime.new
# puts ini
# puts fin
# n6list = primes.n6(ini, fin)
# n6list.each do |key, val|
#   puts "k:#{key} v:#{val}"
# end
# poped = n6list.pop()
# puts
# puts n6list
# puts
# puts poped
# puts


puts
primes.print_naturals(ini*fin)
puts
