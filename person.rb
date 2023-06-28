require_relative 'nameable'

class Person < Nameable
  def initialize(_id, age, name = 'Unknown', parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age.to_i >= 18
  end

  def generate_id
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    random_number = rand(1_000_000..9_999_999)
    "#{timestamp}-#{random_number}"
  end
end
