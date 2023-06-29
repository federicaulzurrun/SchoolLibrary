require_relative 'nameable'

class Person < Nameable
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :age, :name, :rentals

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_book(rental)
    rentals.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
