# let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
def print_header
  puts "The students of Villains Academy"
  puts "______________"
end

def print(students)
  puts "Please enter a letter to filter students by"
  letter = gets.chomp

  students.each.with_index(1) do |student, i|
    if letter == student[:name][0] && student[:name].size < 12
      puts "#{i}. #{student[:name]} (#{student[:cohort]})"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great student"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create students array
  students = []
  #get student names
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add student hash to the array
    students.push({name: name, cohort: :november})
    puts "Now we have #{students.count} students"
    # get another name
    name = gets.chomp
  end
  #return students
  students
end

#calling the methods
students = input_students
print_header
print(students)
print_footer(students)
