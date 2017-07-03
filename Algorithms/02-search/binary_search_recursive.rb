# given array and target value, returns that value from array or nil
def recursive_binary(array, target)
    low = 0
    high = array.length - 1
    mid = (low+high) / 2
    
    if low <= high
        return array[mid] if array[mid] == target
        
        if array[mid] > target
            recursive_binary(array[low...mid], target)
        elsif array[mid] < target
            recursive_binary(array[mid+1..high], target)
        end
    end
end

# tests:

arr = "a b c d e f g h i j k l m n o p".split

puts recursive_binary(arr, "a")
puts recursive_binary(arr, "b")
puts recursive_binary(arr, "h")
puts recursive_binary(arr, "i")
puts recursive_binary(arr, "l")
puts recursive_binary(arr, "p")
puts recursive_binary(arr, "q")
