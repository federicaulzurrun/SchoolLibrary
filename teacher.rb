require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      type: 'teacher',
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission
    }
  end
end
