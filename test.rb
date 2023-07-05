require 'rspec'
require_relative 'book'
require_relative 'person'
require_relative 'rental'
require 'date'


RSpec.describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new('John Doe', 25) }
  let(:date) { Date.new(2023, 6, 27) }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'creates a new rental with date, book, and person' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)

      expect(book.rentals).to contain_exactly(rental)
      expect(person.rentals).to contain_exactly(rental)
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the rental' do
      expected_hash = {
        book: book.title,
        person: person.name,
        date: '2023-06-27'
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end
end

RSpec.describe Book do
  describe "#rent_book" do
    let(:person) { Person.new("John Doe") }
    let(:date) { Date.today }
    let(:book) { Book.new("Title", "Author") }

    it "creates a new rental and adds it to the rentals array" do
      rental = book.rent_book(person, date)
      expect(rental).to be_an_instance_of(Rental)
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe "#to_hash" do
    let(:book) { Book.new("Title", "Author") }

    it "returns a hash representation of the book" do
      hash = book.to_hash
      expect(hash).to be_a(Hash)
      expect(hash).to eq({ title: "Title", author: "Author" })
    end
  end
end
