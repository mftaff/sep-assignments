def linear_search(array, target)
    count = 0
    target_index = nil
    
    array.length.times do |index|
        count += 1
        if array[index] == target
            target_index = index 
            break
        end
    end
    [count, target_index]
end

# tests

arr10 = [*0...10]
arr20 = [*0...20]
arr50 = [*0...50]
arr100 = [*0...100]
arr500 = [*0...500]
arr1_000 = [*0...1_000]
arr10_000 = [*0...10_000]

puts linear_search(arr10, 9).first
puts linear_search(arr20, 19).first
puts linear_search(arr50, 49).first
puts linear_search(arr100, 99).first
puts linear_search(arr500, 499).first
puts linear_search(arr1_000, 999).first
puts linear_search(arr10_000, 9_999).first
