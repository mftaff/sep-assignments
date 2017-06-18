require 'benchmark'

require_relative 'node'
require_relative 'linked_list'

list = LinkedList.new
array = Array.new
n = 10_000

Benchmark.bm(7) do |x|
  x.report("create array:") { n.times { |i| array << n } }
  x.report("create llist:") { n.times { |i| list.add_to_tail(Node.new(i)) } }  
  
  x.report("access array:") { array[5_000] }
  x.report("access llist:") { list.find_node_by_data(5_000) } 
  
  x.report("modify array:") { array.delete_at 5_000 }
  x.report("modify llist:") { list.delete_node_by_data(5_000) }
end
