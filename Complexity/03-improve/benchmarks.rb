require 'benchmark'

require_relative 'improving_complexity_v0'
require_relative 'improving_complexity_v1'
require_relative 'improving_complexity_v2'
require_relative 'improving_complexity_v3'

# arr1 = [1, 3, 2, 5, 4, 0]
# arr2 = [11, 10, 9, 8, 7, 6]
# arr3 = [17, 12, 16, 15, 13, 14]
# arr4 = [18, 22, 20, 19, 21, 25, 23, 24]

# arr1 = [*0...10].shuffle
# arr2 = [*10...20].shuffle
# arr3 = [*20...30].shuffle
# arr4 = [*30...40].shuffle

# arr1 = [*0...100].shuffle
# arr2 = [*100...200].shuffle
# arr3 = [*200...300].shuffle
# arr4 = [*300...400].shuffle

# arr1 = [*0...10_000].shuffle
# arr2 = [*10_000...20_000].shuffle
# arr3 = [*20_000...30_000].shuffle
# arr4 = [*30_000...40_000].shuffle

# arr1 = [*0...10_000].reverse
# arr2 = [*10_000...20_000].reverse
# arr3 = [*20_000...30_000].reverse
# arr4 = [*30_000...40_000].reverse

base = [*0...40_000].shuffle
arr1 = base[0...10_000]
arr2 = base[10_000...20_000]
arr3 = base[20_000...30_000]
arr4 = base[30_000...40_000]

arrA = arr1.dup
arrB = arr2.dup
arrC = arr3.dup
arrD = arr4.dup

arrE = arr1.dup
arrF = arr2.dup
arrG = arr3.dup
arrH = arr4.dup

arrI = arr1.dup
arrJ = arr2.dup
arrK = arr3.dup
arrL = arr4.dup
 
arrM = arr1.dup
arrN = arr2.dup
arrO = arr3.dup
arrP = arr4.dup

sorted_case = [*0...40_000]
# puts "array1 sorted? #{sorted_case == poorly_written_ruby(arrD, arrB, arrA, arrC)}"
# puts "array2 sorted? #{sorted_case == concat_arrays_v1(arrH, arrF, arrE, arrG)}"
# puts "array3 sorted? #{sorted_case == concat_arrays_v2(arrL, arrJ, arrI, arrK)}"
# puts "array4 sorted? #{sorted_case == concat_arrays_v3(arrP, arrN, arrM, arrO)}"

Benchmark.bmbm do |x|
  x.report("v0:") { poorly_written_ruby(arrD, arrB, arrA, arrC) }
  x.report("v1:") { concat_arrays_v1(arrH, arrF, arrE, arrG) }
  x.report("v2:") { concat_arrays_v2(arrL, arrJ, arrI, arrK) }
  x.report("v3:") { concat_arrays_v3(arrP, arrN, arrM, arrO) }
end
