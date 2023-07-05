require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  context "When creating a Person" do
    it "should have a unique random ID" do
      person1 = Person.new(25)
      person2 = Person.new(30)
      expect(person1.id).not_to eq(person2.id)
    end
    
    it "should contain the given age" do
      age = 30
      person = Person.new(age)
      expect(person.age).to eq(age)
    end

    it "should contain the given name" do
      name = 'Milo'
      person = Person.new(44, name)
      expect(person.name).to eq(name)
    end

    it "should have parent permision by default" do
      person = Person.new(19)
      expect(person.can_use_services?).to be(true)
    end

    it "should have an empty rentals array" do
      person = Person.new(22)
      expect(person.rentals).to be_empty
    end
  end

  context "When checking if a person can use services" do
    it "should return true if the person is of age" do
      age = 18
      person = Person.new(age)
      expect(person.can_use_services?).to be(true)
    end

    it "should return true if the person has parent permission" do
      person = Person.new(17, 'Emily Blunt', parent_permission: true)
      expect(person.can_use_services?).to be(true)
    end

    it "should return false if the person is not of age and has no parent permission" do
      person = Person.new(14, 'Nathaly Portman', parent_permission: false)
      expect(person.can_use_services?).to be(false)
    end
  end

  context "When getting the correct name" do
    it "should return the person's name" do
      name = "Katalina Laboure"
      person = Person.new(32, name)
      expect(person.correct_name).to eq(name)
    end
  end

  context "When renting a book" do
    it "should create a new RentalBook instance" do
      age = 21
      name = "Jenny Bottle"
      person = Person.new(age, name)

      book = Book.new("Title", "Author")
      rental_date = "2023-07-04"

      rental = book.rent_book(person, rental_date)

      expect(rental).to be_an_instance_of(Rental)
      expect(rental.book).to eq(book)
      expect(rental.date).to eq(rental_date)
      expect(rental.person).to eq(person)

      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end