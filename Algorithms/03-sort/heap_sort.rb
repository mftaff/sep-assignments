require_relative 'max_heap'
# require_relative 'min_binary_heap'
require_relative 'node'

def heap_sort(array)
    heap = MaxBinaryHeap.new(array.delete(array.max))
    
    array.each do |item| 
        heap.insert(item)
    end
    
    heap.returnArray.reverse
end

# tests

# arr = [3, 4, 6, 2, 1, 7, 9, 10, 5, 8].shuffle

# puts "\n after sort: #{heap_sort(arr)}"
