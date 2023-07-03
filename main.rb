require_relative 'app'

class Main
  def initialize
    @app = App.new(self)
  end

  def display_menu
    puts '---------------------------'
    puts 'Welcome to the Library App!'
    puts '---------------------------'
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
    puts '---------------------------'

    option = gets.chomp.to_i

    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_for_person
    when 7
      @app.end_app
    else
      puts 'Invalid option'
      display_menu
    end
  end

  def start
    display_menu
  end
end

Main.new.start
