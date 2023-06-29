class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(rental)
    @rentals.push(rental)
    rental.book = self
  end
end

# Create a book
book = Book.new('Book Title', 'Author Name')
puts book.title
puts book.author