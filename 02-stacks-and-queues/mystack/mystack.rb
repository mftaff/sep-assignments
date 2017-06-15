class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.size] = item
    self.top = @stack.last
  end

  def pop
    temp = @stack.last
    @stack = @stack[0...-1]
    self.top = @stack.last
    temp
  end

  def empty?
    @stack == [] ? true : false
  end
end