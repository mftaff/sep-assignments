require 'benchmark'

require_relative 'binary_search_tree'

start_root = Node.new(1, 1)
binary_tree = BinarySearchTree.new(start_root)

nodes = [] 

(2..10_000).each { |i| nodes << Node.new(i, i) }

Benchmark.bm(7) do |x|
  x.report("create tree:") { nodes.each { |node| binary_tree.insert(binary_tree.root, node) } }
  
  x.report("access tree min:") { binary_tree.find(binary_tree.root, 1_000) }
  x.report("access tree mid:") { binary_tree.find(binary_tree.root, 5_000) }
  x.report("access tree max:") { binary_tree.find(binary_tree.root, 10_000) }
  
  x.report("modify tree min:") { binary_tree.delete(binary_tree.root, 1_000) }
  x.report("modify tree mid:") { binary_tree.delete(binary_tree.root, 5_000) }
  x.report("modify tree max:") { binary_tree.delete(binary_tree.root, 10_000) }
end
