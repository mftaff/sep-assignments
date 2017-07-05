require 'benchmark'

require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'



arr1 = [*1..3_000].shuffle
arr2 = arr1.dup
arr3 = arr1.dup

Benchmark.bm(7) do |x|
  x.report("quick sort:") { quick_sort(arr1) }
  x.report("buckt sort:") { arr2 = bucket_sort(arr2, (arr2.length/3).floor + 1) }
  x.report("heap  sort:") { arr3 = heap_sort(arr3) }
end

# puts "array1: #{arr1}"
# puts "array2: #{arr2}"
# puts "array3: #{arr3}"
