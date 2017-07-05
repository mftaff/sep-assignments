def quick_sort(array, strt=0, stop=array.length-1)
    return array if strt >= stop
    piv_index = stop

    (strt...stop).each do |index|
        puts "item #{array[index]}"
        if array[index] > array[piv_index]
            puts "pivot: #{array[piv_index]}"
            puts "piv_index: #{piv_index}"
            puts "array     : #{array}"
            array.insert(piv_index, array.delete_at(index))
            piv_index -= 1
            # puts "pivot_index: #{piv_index}"
            puts "arrayafter: #{array}"
        end
    end
    quick_sort(array, strt, piv_index-1)
    quick_sort(array, piv_index+1, stop)
end

# def quick_sort(collection, min=0, max=collection.length-1)
#   return collection if min >= max
#   pivot = min
#   ((min + 1)..max).each do |i|
#     if collection[i] < collection[pivot]
#       collection[pivot], collection[i] = collection[i], collection[pivot]
#       collection[i], collection[pivot + 1] = collection[pivot+1], collection[i]
#       pivot += 1
#     end
#   end
#   quick_sort(collection, min, pivot - 1)
#   quick_sort(collection, pivot + 1, max)
# end

# tests

arr = "e c a b f g d".split

puts "\nafter sort: #{quick_sort(arr)}"
