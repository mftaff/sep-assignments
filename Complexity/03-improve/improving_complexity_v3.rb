# This method takes n arrays as input and combine them in sorted ascending  order
def concat_arrays_v3(*arrays)
    buckets = []
    sorted_array = []
    
    arrays.each do |array|
        array.each do |item|
            i = item/3
            buckets[i] ? buckets[i] << item : buckets[i] = [item]
        end
    end
    
    buckets.each do |bucket|
        bucket.length.times do |i|
            bucket[i], bucket[i+1] = bucket[i+1], bucket[i] if bucket[i+1] && bucket[i+1] < bucket[i] 
            bucket[i], bucket[-1] = bucket[-1], bucket[i] if bucket[-1] < bucket[i] 
        end
        bucket.each { |item| sorted_array << item }
    end
    
    # Return the sorted array
    sorted_array
end

# # tests

# # arr1 = [*0...10].shuffle
# # arr2 = [*10...20].shuffle
# # arr3 = [*20...30].shuffle
# # arr4 = [*30...40].shuffle
# # check = [*0...40]

# arr1 = [*0...10_000].shuffle
# arr2 = [*10_000...20_000].shuffle
# arr3 = [*20_000...30_000].shuffle
# arr4 = [*30_000...40_000].shuffle
# check = [*0...40_000]

# sorted = concat_arrays_v3(arr4, arr2, arr1, arr3)

# # puts "Final Array: #{sorted}"
# puts "sorted correctly? #{sorted == check}"
