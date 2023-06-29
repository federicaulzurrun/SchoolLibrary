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
