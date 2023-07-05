require 'rspec'
require 'date'
require_relative '../book'
require_relative '../person'
require_relative '../rental'
require_relative '../decorator'
require_relative '../classroom'
require_relative '../student'

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

RSpec.describe Decorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'delegates the correct_name method to the nameable object' do
      allow(nameable).to receive(:correct_name).and_return('John Doe')
      expect(subject.correct_name).to eq('John Doe')
    end
  end
end

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the name returned by the nameable object' do
      allow(nameable).to receive(:correct_name).and_return('john doe')
      expect(subject.correct_name).to eq('John doe')
    end
  end
end

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    context 'when the name is longer than 10 characters' do
      it 'trims the name to the first 10 characters' do
        allow(nameable).to receive(:correct_name).and_return('Johnathan Doe')
        expect(subject.correct_name).to eq('Johnathan ')
      end
    end

    context 'when the name is not longer than 10 characters' do
      it 'returns the name as is' do
        allow(nameable).to receive(:correct_name).and_return('John Doe')
        expect(subject.correct_name).to eq('John Doe')
      end
    end
  end
end

RSpec.describe Classroom do
  let(:classroom_label) { 'Mathematics' }
  let(:classroom) { described_class.new(classroom_label) }
  let(:student) { Student.new('John Doe') }

  describe '#initialize' do
    it 'sets the classroom label' do
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the students array' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom for the added student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
