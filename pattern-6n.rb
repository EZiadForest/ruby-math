# encoding: utf-8

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
  ini = 1
end

$primes = Primes::Prime.new

def process_num (num)
  is_prime = $primes.is_prime num
  if is_prime
    # puts "" if $previous_is_prime == false
    # puts "" if $previous_is_prime
    print "#{num} "
    $previous_is_prime = true
  else
    print $no_prime_char
    $previous_is_prime = false
  end
  is_prime
end



$prime_char = '0'
$no_prime_char = '· '
$previous_is_prime = true
$acum = 0
sqrt = Math::sqrt(ini*6-1)
$index = sqrt.floor+1
$index = 1 if sqrt == 1.0
$primes_in_line = $index * $index

(ini..fin).each do |num_to_check|
  n6 = num_to_check*6
  num1 = num_to_check*6-1
  num2 = num_to_check*6+1
  (n6-1..n6+5).each do |num|
    if num > $primes_in_line
      puts ""
      $index = $index+1
      $primes_in_line = $index * $index
    end
    if num == num1 or num == num2
      process_num num
    else
      print $no_prime_char
    end
  end


  # if num2 >= $primes_in_line
  #   puts ""
  #   $acum = 0
  #   $index = $index+1
  #   $primes_in_line = $index * $index

  # end
  # if $primes.is_prime num2
  #   # puts "" if $previous_is_prime == false
  #   # puts "" if $previous_is_prime
  #   print "#{num2} "
  #   $previous_is_prime = true
  # else
  #   print no_prime_char
  #   $previous_is_prime = false
  # end
  # $acum = $acum + 1


  # puts ""
end
puts ""
