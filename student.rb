require_relative 'person'

class Student < Person
  def initialize(id, age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(id, age, name, parent_permission)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
