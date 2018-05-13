# let's put all students into an array
@students = []

def interactive_menu
  loop do
  print_options
  # 2. read the input and save it into a variable
  process(gets.chomp)
  # 4. repeat from step 1
  end
end

def print_options
  #1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(option)
  # 3. do what the user has asked
  case option
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_to_file
    when "9"
      exit #end the program
    else
      puts "Try again. Please enter one of the options "
  end

end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

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
    @students.push({name: name, cohort: cohort, hobbies: [], COB: :canada, height: rand(7)})
    if @students.count < 2
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name
    name = gets.delete("\n")
  end

end

def print_header
  puts "The students of Villains Academy"
  puts "______________"
end

def print_students_list
  if @students.length == 0
    return

  end
  puts "Please enter a letter to filter students by"
  letter = gets.delete("\n")
  i = 0
  while i < @students.length do
    if letter == @students[i][:name][0] && @students[i][:name].size < 12
      puts "#{i}. #{@students[i][:name]} (#{@students[i][:cohort]})".center(50)
    end
    i += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student".center(50)
end

def save_to_file
  #open the csv File
  file = File.open('students.csv', "w")
  @students.each do |student|
    st_data = [student[:name],student[:cohort]]
    csv_line  = st_data.join(',')
    file.puts csv_line
  end
  file.close
end

interactive_menu
