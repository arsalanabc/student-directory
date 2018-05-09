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
  i = 0
  while i < students.length do
    if letter == students[i][:name][0] && students[i][:name].size < 12
      puts "#{i}. #{students[i][:name]} (#{students[i][:cohort]})"
    end
    i += 1
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
    students.push({name: name, cohort: :november, hobbies: [], COB: :canada, height: rand(7)})
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
