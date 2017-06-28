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
  
  def find(root, data)
  end
  
  def delete(root, data)
  end
  
  def printf(children=nil)
  end
  
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
  
  #swaps children of two nodes, does not work if one node is @root
  def safe_child_swap(node, swap_node)
    unless swap_root == @root
      temp_left = node.left
      temp_right = node.right
      
      node.left = swap_node.left
      node.right = swap_node.right
      
      swap_node.left = temp_left
      swap_node.right = temp_right
    else
      #swap root somehow
    end
  end
  
  def swap(root, node, parent, swap_parent, swap_case)
    # switch parent's right and left children
    if swap_case == "type1"
      safe_child_swap(node, parent.left)
      
      parent.right = parent.left
      parent.left = node
    # swaps parent.left with swap_parent.right
    elsif swap_case == "type2"
      safe_child_swap(node, swap_parent.right)
      
      parent.left = swap_parent.right
      swap_parent.right = node
    elsif swap_case == "type3"
      safe_child_swap(node, swap_parent.right)
      
      parent.left = swap_parent.right
      swap_parent.right = node
    end
  end
  
  def next_parent(parent_row, index)
    return parent_row[index+1] if parent_row[index+1]
    return parent_row.first.parent if parent_row.first.parent
    return @root
  end
  
  def min_sort(node)
    if node != @root
      parent_row = get_parent_row(@root, node).reverse
      
      parent_row.each_with_index do |curr_parrent, index|
        if node.parent == curr_parrent
          if curr_parrent.right == node
            node.rating < curr_parrent.left.rating ? swap(@root, node, curr_parrent, nil, "type1") : return
          end
          if curr_parrent.left == node
            lefter_parent = next_parent(parent_row, index)
            
            if lefter_parent == parent_row[index+1]
              node.rating < lefter_parent.right.rating ? swap(@root, node, curr_parrent, lefter_parent, "type2") : return
            elsif lefter_parent == parent_row.first.parent
              node.rating < lefter_parent.right.rating ? swap(@root, node, curr_parrent, lefter_parent, "type3") : return
              min_sort(node)
            end
          end
        end
      end
    end
  end
end