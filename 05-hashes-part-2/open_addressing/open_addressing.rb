require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    true_index = self.index(key, self.size)
    
    if not @items[true_index]
      @items[true_index] = [key, value]
    elsif @items[true_index] == [key, value]
      nil
    else
      puts "items: #{ @items }"
      puts "in else"
      next_slot = next_open_index(true_index) 
      if next_slot != -1
        @items[next_slot] = [key, value]
      elsif next_slot == -1
        self.resize
        self[key] = value
      end
    end
  end

  def [](key)
    true_index = self.index(key, self.size)
    
    if @items[true_index].first == key
      @items[true_index].last
    else
      # uncomment if you want to increment starting from true_index
      while true_index < @items.length
        true_index += 1
        return @items[true_index].last if @items[true_index] && @items[true_index].first == key 
      end
      
      # # uncomment if you want to increment starting from index 0
      # @items.each { |item| return item.last if item.first == key }
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.bytes.inject(:+) % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    # uncomment if you want to find the next open index from true_index
    while index < @items.length - 1
      index += 1 if @items[index]
      puts index if not @items[index]
      return index if not @items[index]
    end
    -1
    
    # # uncomment if you want to find the next open index from 0
    # @items.each_with_index { |item, index| return index if not item }
    # -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(temp.length*2)
    
    temp.each { |item| self[item.first] = item.last if item }
  end
end