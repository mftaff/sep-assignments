class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
  end

  def enqueue(element)
    @queue[@queue.size] = element
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    temp = @head
    @queue = @queue[1..-1]
    @head = @queue.first
    @tail = @queue.last
    temp
  end

  def empty?
    @queue == [] ? true : false
  end
end