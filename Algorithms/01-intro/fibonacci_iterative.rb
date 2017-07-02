 def fib(n)
    fib_0 = 0
    fib_1 = 1

    n.times do
        temp = fib_0
        fib_0 = fib_1
        fib_1 = temp + fib_1
    end
    fib_0
 end

 puts fib(0) # should output 0
 puts fib(1) # should output 1
 puts fib(2) # should output 1
 puts fib(3) # should output 2
 puts fib(4) # should output 3
 puts fib(5) # should output 5
 puts fib(6) # should output 8
 puts fib(7) # should output 13
 puts fib(8) # should output 21
 puts fib(9) # should output 34
 