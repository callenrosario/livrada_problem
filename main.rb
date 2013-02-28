# Returns the digital sum of a natural number.
def digital_sum(n)
  n.to_s.split("").collect(&:to_i).inject(:+)
end

max = 99
result = 0

# Returns the maximum digital sum of all natural
# numbers a^b where a,b < 100. 
#
# Start with the maximum power and then incrementally
# divide. Skip to the next value of 'a' when the maximum
# possible digital sum cannot reach the current maximum
# digital sum anymore.
max.downto(0).each do |a|
  power = a**max
  while power > a
    break if result > power.to_s.length * 9
    sum = digital_sum(power)
    result = sum if result < sum 
    power /= a
  end
end

p result
