class Person
  attr_reader :id, :name, :age

  def initialize(name = 'Unknown', age = nil, parent_permission = true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age.to_i >= 18
  end

  def generate_id
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    random_number = rand(1000000..9999999)
    "#{timestamp}-#{random_number}"
  end
end
