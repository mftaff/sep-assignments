require_relative 'min_binary_heap'
require_relative 'node'

def heap_sort(array)
    root = Node.new(array.delete(array.max))
    heap = MinBinaryHeap.new(root)
    
    array.each_with_index do |item, i| 
        heap.insert(root, Node.new(item) )
    end
    
    heap.returnArray
end

# tests

arr = [3, 4, 6, 2, 1, 7, 9, 10, 5, 8]
# arr = [10,9,8,7,6,5,4,3,2,1]

puts "\n after sort: #{heap_sort(arr)}"
