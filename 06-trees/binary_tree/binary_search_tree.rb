require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating < node.rating
      unless root.right
        root.right = node
        root.right.parent = root
      else
        insert(root.right, node)
      end
    elsif root.rating > node.rating
      unless root.left
        root.left = node
        root.left.parent = root
      else
        insert(root.left, node)
      end
    else
      puts "else error in insert!!!"
    end
  end

  # Recursive Depth First Search
  def find(root, node_title)
    if root.title == node_title
      root
    elsif root.right
      find(root.right, node_title)
    elsif root.left
      find(root.left, node_title)
    else
      # puts "\n\n\"#{node_title}\" not found in tree."
    end
  end

  def delete(root, data)
    node_to_delete = find(root, data)
    return nil if not node_to_delete
    
    if node_to_delete.parent.left == node_to_delete
      node_to_delete.parent.left = nil
    else
      node_to_delete.parent.right = nil
    end
      
    node_to_delete = nil
  end

  # Recursive Breadth First Search
  def printf
    root = @root
    tree = [root]
    
    tree.each do |node|
      tree << node.left if node.left
      tree << node.right if node.right
    end
    
    puts tree.map{ |node| "#{node.title}: #{node.rating}"  }.join "\n"
  end
end
