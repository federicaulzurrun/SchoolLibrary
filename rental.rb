class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_hash
    {
      book: book.title,
      person: person.name,
      date: date.to_s
    }
  end
end
