def bucket_sort(array, n=4)
    buckets = Array.new(n) { [] }
    
    array.each { |item| buckets[item/3] << item }
    
    array = []
    
    buckets.each do |bucket|
        bucket.length-1.times { |num| bucket[num], bucket[-1] = bucket[-1], bucket[num] if bucket[-1] < bucket[num] }
        bucket.each { |item| array << item }
    end
    
    array
    # buckets.flatten
end

# test

# arr = [3, 4, 6, 2, 1, 7, 9, 10, 5, 8]

# # bucket_sort(arr)
# puts "\nafter bucket srt: #{bucket_sort(arr)}"
