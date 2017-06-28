require_relative 'node'

class MinBinaryHeap
  attr_accessor :root
  
  def initialize(root)
    @root = root
  end
  
  def insert(root, node)
    resolved = false
    root == @root ? row = [root] : row = root
    next_row = []
    
    row.each do |parent_node|
      if not parent_node.left
        parent_node.left = node
        node.parent = parent_node
        resolved = true
        break
      elsif not parent_node.right
        parent_node.right = node
        node.parent = parent_node
        resolved = true
        break
      else
        next_row << parent_node.left << parent_node.right
      end
    end
    resolved ? min_sort(node) : insert(next_row, node)
  end
  
  def find(node, target_title)
    return nil if not node
    return node if node.title == target_title

    right = find(node.right, target_title) 
    left = find(node.left, target_title)
    
    return right if right
    return left if left
  end
  
  def delete(node, target_title)
    target = find(node, target_title)
    
    if target
      nodes = collect_nodes(target)
      @root = nodes[0]
      
      nodes[1..-1].each do |n| 
        insert(@root, n)
      end
    end
  end
  
  # returns array of all nodes in tree with option to exclude one
  def collect_nodes(exclude=nil, root=@root)
    tree = [root]
    
    tree.each do |node| 
      tree << node.left if node.left 
      tree << node.right if node.right
    end
    
    if exclude # return list of detached nodes, and delete the target
      tree.delete exclude
      return tree.each do |lone_node|
        lone_node.left = nil
        lone_node.right = nil
        lone_node.parent = nil
      end
    else
      tree
    end
  end
  
  # prints a string of tree Breadth First
  def printf
    puts collect_nodes().map{ |node| "#{node.title}: #{node.rating}"  }.join "\n"
  end
  
  private
  
  # takes in a node and sorts it in the tree  
  def min_sort(node)
    if node != @root
      parent_row = get_parent_row(@root, node).reverse
      
      parent_row.each_with_index do |curr_parrent, index|
        if node.parent == curr_parrent
          if curr_parrent.right == node
            node.rating < curr_parrent.left.rating ? swap(node, curr_parrent, nil, "same_parent") : return
          end
          if curr_parrent.left == node
            lefter_parent = next_parent(parent_row, index)

            if lefter_parent != @root
              node.rating < lefter_parent.right.rating ? swap(node, curr_parrent, lefter_parent, "diff_parent") : return
              min_sort(node) if lefter_parent == parent_row.first.parent
            elsif lefter_parent == @root
              node.rating < @root.rating ? swap(node, curr_parrent, @root, "new_root") : return
            end
          end
        end
      end
    end
  end
  
  # gets all nodes that are the same generation as node's parents
  def get_parent_row(root, node)
    root == @root ? parent_row = [root] : parent_row = root
    child_row = []
    
    parent_row.each do |curr_node|
      if curr_node.left == node
        return parent_row
      else
        child_row << curr_node.left
      end
      
      if curr_node.right == node
        return parent_row 
      else
        child_row << curr_node.right
      end
    end
    get_parent_row(child_row, node)
  end
  
  # returns the parent of the node we want to swap (used when swapped nodes do not share parent)
  def next_parent(parent_row, index)
    return parent_row[index+1] if parent_row[index+1]
    return parent_row.first.parent if parent_row.first.parent
    return @root
  end

  # swap two nodes and preserve rest of tree
  def swap(node, parent, swap_parent, swap_case)
    if swap_case == "same_parent" # swaps two children of same parent
      child_swap(node, parent.left)
      
      parent.right = parent.left
      parent.left = node
    elsif swap_case == "diff_parent" # swaps two children of different parents
      child_swap(node, swap_parent.right)
      
      parent.left = swap_parent.right
      swap_parent.right = node
    elsif swap_case == "new_root" # swaps node with @root
      # swap_parent here is @root
      
      @root = node
      
      node.right = swap_parent.right
      
      swap_parent.right = swap_parent.left.right
      swap_parent.left = swap_parent.left.left
      
      node.left = swap_parent
    end
  end
    
  # swaps children of two nodes, does not work if one node is @root
  def child_swap(node, swap_node)
    unless swap_root == @root
      temp_left = node.left
      temp_right = node.right
      
      node.left = swap_node.left
      node.right = swap_node.right
      
      swap_node.left = temp_left
      swap_node.right = temp_right
    else
      puts "nonSysERROR: cannot call child_swap on @root"
    end
  end
end