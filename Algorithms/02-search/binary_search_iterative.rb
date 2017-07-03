# given an array and a target, returns index of target or 'not found'
def iterative_binary(array, target)
    low = 0
    high = array.size - 1
    
    while low <= high
        mid = (low+high) / 2
        
        if array[mid] > target
            high = mid - 1
        elsif array[mid] < target
            low = mid + 1
        else
            return mid
        end
    end
end

# tests:

arr = "a b c d e f g h i j k l m n o p".split

puts iterative_binary(arr, "a")
puts iterative_binary(arr, "i")
puts iterative_binary(arr, "l")
puts iterative_binary(arr, "p")
puts iterative_binary(arr, "q")
