def find_median(a, b)
  raise "size mismatch" if a.size != b.size
  if a.size == 1
    return (a[0] + b[0])/2
  end

  if a.size.odd?
    median_index_1 = median_index_2 = (a.size + 1)/2 - 1
  else
    median_index_1 = a.size/2 - 1
    median_index_2 = a.size/2
  end

  median_value_a = (a[median_index_1] + a[median_index_2]) / 2
  median_value_b = (b[median_index_1] + b[median_index_2]) / 2

  if median_value_a < median_value_b
    return find_median(a[median_index_2..(a.size - 1)],
      b[0..median_index_1]
    )
  else
    return find_median(a[0..median_index_1],
      b[median_index_2..(b.size - 1)]
    )
  end
end
