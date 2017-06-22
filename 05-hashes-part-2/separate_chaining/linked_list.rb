require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  # def add_to_tail(node)
  #   if not @head
  #     @head = node
  #     @tail = @head
  #   else
  #     temp = @head
  #     while @head
  #       if not @head.next
  #         @head.next = node
  #         @tail = @head.next
  #         break
  #       end
  #       @head = @head.next
  #     end
  #     @head = temp
  #   end
  # end

  # # This method removes the last node in the lists and must keep the rest of the list intact.
  # def remove_tail
  #   if @head == @tail
  #     @head = nil
  #     @tail = nil
  #   else
  #     temp = @head
  #     while @head
  #       if not @head.next.next
  #         @head.next = nil
  #         @tail = @head
  #         break
  #       else
  #         @head = @head.next
  #       end
  #     end
  #     @head = temp
  #   end
  # end

  # # This method prints out a representation of the list.
  # def print
  #   node = @head
  #   while node 
  #     puts node.data
  #     node = node.next
  #   end
  # end

  # # This method removes `node` from the list and must keep the rest of the list intact.
  # def delete(node)
  #   if @head == node
  #     @head = @head.next
  #   else
  #     temp = @head
  #     while @head
  #       if @head.next == node
  #         @head.next = node.next
  #         @tail = @head if not node.next
  #         break
  #       end
  #       @head = @head.next
  #     end
  #     @head = temp
  #   end
  # end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = @head
    @head = node
    @head.next = temp
  end

  # # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  # def remove_front
  #   @head = @head.next if @head
  # end
  
  def list_length
    node = @head
    count = 0
    while node 
      count += 1
      node = node.next
    end
    count
  end
  
  def value_present(value)
    temp = @head
    while temp
      return true if temp.value == value
      temp = temp.next
    end
  end
end
