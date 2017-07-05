class MaxBinaryHeap
  attr_accessor :array
  
  def initialize(root)
    @array = [root]
  end
  
  def insert(node)
    @array << node
    
    swap(node)
  end
  
  def swap(node)
    unless node == @array.first
      node_index = @array.index node
      if node > @array[node_index-1]
        @array[node_index], @array[node_index-1] = @array[node_index-1], @array[node_index]
        swap(node)
      end
    end
  end
  
  def returnArray
    @array
  end
end
