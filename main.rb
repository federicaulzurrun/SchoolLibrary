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

    choice = gets.chomp.to_i

    case choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person
    when 7
      quit_program
    else
      puts 'Invalid choice. Please try again.'
      display_menu
    end
  end

  def main
    display_menu
  end
end

Main.new.main
