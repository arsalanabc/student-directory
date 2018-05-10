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
  letter = gets.delete("\n")
  i = 0
  while i < students.length do
    if letter == students[i][:name][0] && students[i][:name].size < 12
      puts "#{i}. #{students[i][:name]} (#{students[i][:cohort]})".center(50)
    end
    i += 1
  end


end

def print_footer(names)
  puts "Overall, we have #{names.count} great student".center(50)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create students array
  students = []
  #get student names
  name = gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter a Cohort for #{name}"
    cohort = gets.delete("\n")
    if cohort.empty?
      cohort = :november
      # if there is typo in cohort then we can create a list of months and match what user inputs and pick the closest match
    end
    #add student hash to the array
    students.push({name: name, cohort: cohort, hobbies: [], COB: :canada, height: rand(7)})
    if students.count < 2
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name
    name = gets.delete("\n")
  end
  #return students
  students
end

def group_by_cohort(students)
  category = "cohort".to_sym
  new_hash = {}

  students.each do |row|

    if !new_hash[row[category]]
      new_hash[row[category]] = []
    end
    new_hash[row[category]].push(row["name".to_sym])
  end

  new_hash.each do |row|
    puts row
  end

end

#calling the methods
students = input_students
print_header
print(students)
print_footer(students)
group_by_cohort(students)
