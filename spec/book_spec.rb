require 'rspec'
require 'date'
require_relative '../book'

RSpec.describe Book do
  describe '#rent_book' do
    let(:person) { Person.new('John Doe') }
    let(:date) { Date.today }
    let(:book) { Book.new('Title', 'Author') }

    it 'creates a new rental and adds it to the rentals array' do
      rental = book.rent_book(person, date)
      expect(rental).to be_an_instance_of(Rental)
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#to_hash' do
    let(:book) { Book.new('Title', 'Author') }

    it 'returns a hash representation of the book' do
      hash = book.to_hash
      expect(hash).to be_a(Hash)
      expect(hash).to eq({ title: 'Title', author: 'Author' })
    end
  end
end
