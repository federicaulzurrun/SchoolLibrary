require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom = nil, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    add_student_classroom if clasroom
    super(id, age, name, parent_permission)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_student_classroom(classroom)
    @classroom = classroom
    clasroom.add_student(self) unless classroom.students.include?(self)
  end
end

# Create a student
student = Student.new(1, 18, classroom, 'John Doe')
puts student.name
puts student.classroom.label

# Add another student to the same classroom
student2 = Student.new(2, 17, classroom, 'Jane Smith')
puts student2.name
puts student2.classroom.label
