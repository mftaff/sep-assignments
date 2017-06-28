require 'benchmark'

require_relative 'min_binary_heap'

start_root = Node.new(1, 1)
min_heap = MinBinaryHeap.new(start_root)

nodes = [] 

(2..100_000).each { |i| nodes << Node.new(i, i) }

Benchmark.bm(7) do |x|
  x.report("create heap:") { nodes.each { |node| min_heap.insert(min_heap.root, node) } }
  
  x.report("access tree min:") { min_heap.find(min_heap.root, 10_000) }
  x.report("access tree mid:") { min_heap.find(min_heap.root, 50_000) }
  x.report("access tree max:") { min_heap.find(min_heap.root, 100_000) }
  
  x.report("modify tree min:") { min_heap.delete(min_heap.root, 10_000) }
  x.report("modify tree mid:") { min_heap.delete(min_heap.root, 50_000) }
  x.report("modify tree max:") { min_heap.delete(min_heap.root, 100_000) }
end