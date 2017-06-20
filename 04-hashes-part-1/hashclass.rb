class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
      true_index = self.index(key, self.size)
      
      if @items[true_index] == [key, value]
        nil
      elsif @items[true_index] == nil
        @items[true_index] = [key, value]
      # Next line is for spec: resizes the array when a collision occurs and the values do not match
      # I do not understand why it is allowed. How can one key link to 2 places?
      elsif @items[true_index].first == key 
        self.resize
      else
        self.resize
        self[key] = value
      end
    
    puts "Internal array size: #{self.size}"
    puts "Internal array state:\n#{@items.inspect}"
  end


  def [](key)
    @items[index(key, self.size)].last
  end

  def resize
    temp = @items
    @items = Array.new(self.size * 2)

    temp.each { |item| self[item.first] = item.last if item }
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.bytes.inject(:+) % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end