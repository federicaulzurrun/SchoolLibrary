class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(person, date)
    Rental.new(date, self, person)
  end
end
