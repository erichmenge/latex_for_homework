def profit_to_the_max(a, b)
  a.sort! { |i, j| j <=> i }
  b.sort! { |i, j| j <=> i }
  array_of_numbers = a.size.times.map { |i| a[i]**b[i] }
  return array_of_numbers.inject { |product, num| product * num }
end
