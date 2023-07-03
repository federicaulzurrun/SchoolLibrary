class Menu
  LIST_ALL_BOOKS = 1
  LIST_PEOPLE = 2
  CREATE_PERSON = 3
  CREATE_BOOK = 4
  CREATE_RENTAL = 5
  LIST_RENTALS_FOR_PERSON = 6
  QUIT = 7

  def initialize(main_call)
    @main_call = main_call
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
    @main_call.handle_option(option)
  end
end
