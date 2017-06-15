require "./line.rb"
require "./person.rb"

people = []

["Mary", "James", "Alice", "Mary", "Fred", "Enrique"].each_with_index do |name, n|
    people << Person.new(name, n+1)
end

line1 = Line.new()

line1.status

people.each { |person| line1.join(person) }

line1.join("test") # puts improper object error
line1.leave("Adam") # puts improper object error
line1.join(Line.new()) # puts improper object error

line1.status

line1.leave(people[1])
line1.leave(people[1]) # puts "James not found in line."

line1.status

line1.leave(people[0])

line1.status

line1.leave(people[-1])
line1.leave(people[-2])
line1.leave(people[-3])
line1.leave(people[-4])

line1.status
