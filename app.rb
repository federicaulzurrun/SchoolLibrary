require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize(main_call)
    @main_call = main_call
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books available'
    else
      puts 'List of books:'
      @books.each { |book| puts "#{book.title} by #{book.author}" }
    end
    @main_call.display_menu
  end

  def list_people
    if @people.empty?
      puts 'No people available'
    else
      puts 'List of people:'
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    @main_call.display_menu
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option'
    end
    @main_call.display_menu
  end

  def create_student
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp.upcase == 'y'
    @people.push(Student.new(age, name, parent_permission: parent_permission))
    puts
    puts "Person #{name} was created"
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
    puts
    puts "Person #{name} was created"
  end

  def create_book
    puts 'Enter the book title:'
    title = gets.chomp
    puts 'Enter the book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
    @main_call.display_menu
  end

  def create_rental
    puts 'Select a book (use the ID please), enter your choice below.'
    puts
    @books.each_with_index { |book, index| puts "ID: [#{index}] | Title: #{book.title} - Author #{book.author}" }
    puts
    print 'Please enter the number of the required book: '
    book_selected = gets.chomp.to_i

    puts 'Select a person from the following list (by number, not by ID)'
    puts
    @people.each_with_index do |person, index|
      puts "Number: [#{index}] | Name: #{person.name} - ID: #{person.id} - Age: #{person.age}"
    end
    puts
    print 'Enter the number of the corresponding person: '
    person_selected = gets.chomp.to_i

    print 'Date: '
    rental_date = gets.chomp
    rental = Rental.new(rental_date, @books[book_selected], @people[person_selected])
    @rentals << rental
    puts 'Your selected book has been rented'
    @main_call.display_menu
  end

  def list_rentals_for_person
    puts 'Select a person from the following list:'
    @people.each_with_index do |person, index|
      puts "Number: [#{index}] | Name: #{person.name} - ID: #{person.id}"
    end

    person_index = gets.chomp.to_i

    if person_index.negative? || person_index >= @people.length
      puts 'Invalid person number.'
      return
    end

    person = @people[person_index]

    rentals = @rentals.select { |r| r.person == person }

    puts "Rentals for #{person.name}:"
    rentals.each do |rental|
      puts "#{rental.book.title} by #{rental.book.author} - #{rental.date}"
    end

    @main_call.display_menu
  end

  def end_app
    puts 'Closing the app...'
  end
end
