require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create a Person object
person = Person.new('John Doe', 25)
puts "Person ID: #{person.id}"
puts "Person Name: #{person.name}"
puts "Person Age: #{person.age}"
puts "Can use services? #{person.can_use_services?}"
puts

# Create a Student object
student = Student.new('Jane Smith', 17, true, 'Classroom A')
puts "Student ID: #{student.id}"
puts "Student Name: #{student.name}"
puts "Student Age: #{student.age}"
puts "Classroom: #{student.classroom}"
puts "Can use services? #{student.can_use_services?}"
puts "Playing hooky: #{student.play_hooky}"
puts


# Create a Teacher object
teacher = Teacher.new('Mr. Johnson', 35, true, 'Mathematics')
puts "Teacher ID: #{teacher.id}"
puts "Teacher Name: #{teacher.name}"
puts "Teacher Age: #{teacher.age}"
puts "Can use services? #{teacher.can_use_services?}"
