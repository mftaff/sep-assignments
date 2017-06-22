require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :items

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    new_node = Node.new(key, value)
    true_index = self.index(key, self.size)
    
    if not @items[true_index]
      @items[true_index] = LinkedList.new()
      @items[true_index].head = new_node
    else
      if @items[true_index].value_present value
        nil
      elsif @items[true_index].list_length < 6
        @items[true_index].add_to_front new_node
      elsif @items[true_index].list_length >= 6
        self.resize
        self[key] = value
      else
        puts "ERROR. else called!!!"
      end
    end
    load_factor
  end

  def [](key)
    temp_node = @items[self.index(key, self.size)].head
    while temp_node
      return temp_node.value if temp_node.key == key
      temp_node = temp_node.next
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.bytes.inject(:+) % size
  end

  # Calculate the current load factor
  def load_factor
    stored_val_count = 0
    @items.each { |item| stored_val_count += item.list_length if item }
    result = stored_val_count / self.size.to_f
    
    if result > @max_load_factor
      self.resize
      self.load_factor
    else
      result
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(temp.length*2)
    
    temp.each do |item|
      if item
        current_head = item.head
        while current_head
          self[current_head.key] = current_head.value
          current_head = current_head.next
        end
      end
    end
  end
  
  def show_data
    puts "\n\nSTART of data stream"
    puts "Current Load Factor is: #{load_factor}"
    @items.each_with_index do |llist, index| 
      if llist
        at_bucket = "At bucket ##{index}-> "
        current_head = llist.head
        while current_head
          at_bucket << "[key: #{current_head.key}, value: #{current_head.value}] "
          current_head = current_head.next
        end
        puts at_bucket
      else
        puts "At bucket ##{index}-> nil"
      end
    end
    puts "END of data stream\n\n\n"
  end
end
