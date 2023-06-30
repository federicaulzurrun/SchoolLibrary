require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :age, :name, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..600)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_book(book, date)
    RentalBook.new(book, date, self)
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
