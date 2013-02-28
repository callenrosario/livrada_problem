# Returns the digital sum of a natural number.
def digital_sum(n)
  n.to_s.split("").collect(&:to_i).inject(:+)
end

max = 99 
result = 0

# Returns the maximum digital sum of all natural
# numbers a^b where a,b < 100. 
max.downto(0).each do |a|                   # Start with the maximum possible value of a.
  power = a**max                            # Start with the maximum possible value of b.
  while power > a
    break if result > power.to_s.length * 9 # Skip to a - 1 when the maximum possible digital sum
                                            # can no longer be greater than the current digital
                                            # sum.
    sum = digital_sum(power) 
    result = sum if result < sum 
    power /= a                              # Incrementally divide.
  end
end

p result
