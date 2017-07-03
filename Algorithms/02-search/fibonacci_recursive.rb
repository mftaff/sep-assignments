require 'benchmark'
 
def fib(n)
    if (n == 0)
        return 0
    elsif (n == 1)
        return 1
    else
        return fib(n-1) + fib(n-2)
    end
end
 
# Benchmark.bm(7) do |x|
#     x.report("run fib recursive 20: ") { fib(20) }
#     x.report("run fib recursive 200: ") { fib(200) }
#     x.report("run fib recursive 2_000: ") { fib(2_000) }
#     x.report("run fib recursive 20_000: ") { fib(20_000) }
# end
