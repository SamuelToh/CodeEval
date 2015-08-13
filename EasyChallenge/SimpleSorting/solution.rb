def bubble_sort(arr_to_sort)
  swapped = false
  # Bubblesort only need to look at the 2nd last element
  last_sort_index = arr_to_sort.length - 1

  last_sort_index.times.each do |curr_index|
    # Check if current value is larger than sibling value
    if arr_to_sort[curr_index] > arr_to_sort[curr_index + 1]
      # Prepare to swap - Store the values before swapping
      curr_value, next_value = arr_to_sort[curr_index], arr_to_sort[curr_index + 1]
      arr_to_sort[curr_index] = next_value
      arr_to_sort[curr_index + 1] = curr_value
      swapped = true
     end
  end

  return arr_to_sort if swapped == false
  # Do until no swap occurs
  bubble_sort(arr_to_sort)
end

File.open(ARGV[0]).each do |line|
  sorted = bubble_sort(line.chomp.split(" ").map{|value| value.to_f})
  puts sorted.map{|number| '%0.3f' % number }.join(" ")
end