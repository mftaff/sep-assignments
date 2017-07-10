 # This method takes n arrays as input and combine them in sorted ascending  order
 def poorly_written_ruby(*arrays)
   combined_array = []
   arrays.each do |array|
     array.each do |value|
       combined_array << value
     end
   end

   sorted_array = [combined_array.delete_at(combined_array.length-1)]

   for val in combined_array
     i = 0
     while i < sorted_array.length
       if val <= sorted_array[i]
         sorted_array.insert(i, val)
         break
       elsif i == sorted_array.length - 1
         sorted_array << val
         break
       end
       i+=1
     end
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

# sorted = poorly_written_ruby(arr1, arr2, arr3, arr4)

# # puts "Final Array: #{sorted}"
# puts "sorted correctly? #{sorted == check}"
