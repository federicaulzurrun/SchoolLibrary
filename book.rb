class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
    rental
  end

  def to_hash(_options = {})
    {
      title: @title,
      author: @author
    }
  end
end
