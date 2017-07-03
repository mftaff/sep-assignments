# given array and target value, returns target value's index or nil
def recursive_binary(array, target, high=array.length-1, low=0)
    mid = (low+high) / 2
    
    if low <= high
        return mid if array[mid] == target

        if array[mid] > target
            high = mid - 1
        elsif array[mid] < target
            low = mid + 1
        end
        recursive_binary(array, target, high, low)
    end
end

# tests:

arr = "a b c d e f g h i j k l m n o p".split

puts recursive_binary(arr, "b")
puts recursive_binary(arr, "h")
puts recursive_binary(arr, "i")
puts recursive_binary(arr, "l")
puts recursive_binary(arr, "p")
puts recursive_binary(arr, "q")
