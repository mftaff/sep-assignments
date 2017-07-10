# This method takes n arrays as input and combine them in sorted ascending  order
def concat_arrays_v2(*arrays)
    combined_array = []
    sorted_array = []
    
    arrays.each do |array|
        array.each do |value|
            combined_array << value
        end
    end

    buckets = Array.new(1 + combined_array.length/3) { [] }
    combined_array.each { |item| buckets[item/3] << item }

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

# arr1 = [*0...10_000].shuffle
# arr2 = [*10_000...20_000].shuffle
# arr3 = [*20_000...30_000].shuffle
# arr4 = [*30_000...40_000].shuffle

# check = [*0...40_000]
# # sorted = [*0...40_000]

# sorted = concat_arrays_v2(arr1, arr2, arr3, arr4)

# # puts "Final Array: #{sorted}"
# puts "sorted correctly? #{sorted == check}"
