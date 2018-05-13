# let's put all students into an array
@students = []

def interactive_menu
  loop do
  print_options
  # 2. read the input and save it into a variable
  process(STDIN.gets.chomp)
  # 4. repeat from step 1
  end
end

def print_options
  #1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
    when "4"
      read_from_file
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
  name = STDIN.gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter a Cohort for #{name}"
    cohort = STDIN.gets.delete("\n")
    if cohort.empty?
      cohort = :november
      # if there is typo in cohort then we can create a list of months and match what user inputs and pick the closest match
    end
    #add student hash to the array
    update_students(name, cohort)

    if @students.count < 2
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name
    name = STDIN.gets.delete("\n")
  end

end

def print_header
  puts "The students of Villains Academy"
  puts "______________"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]})"
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

def read_from_file(filename = 'students.csv')
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    name,cohort = line.chomp.split(',')
    update_students(name, cohort)
  end
  file.close

end

def try_to_load_file
  file = ARGV.first # first argument from the command line
  return read_from_file if file.nil? # get out of the method if it isn't given
  if File.exists?(file) # file found
    read_from_file(file)
    puts "Loaded #{@students.count} from #{file}"
  else
    puts "Sorry, #{file} doesn't exist."
    exit # quit the program
  end
end

def update_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_to_load_file
interactive_menu
