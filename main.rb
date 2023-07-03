# require_relative 'app'

# class Main
#   def initialize
#     @app = App.new(self)
#   end

#   def display_menu
#     puts '---------------------------'
#     puts 'Welcome to the Library App!'
#     puts '---------------------------'
#     puts 'Please select an option:'
#     puts '1. List all books'
#     puts '2. List all people'
#     puts '3. Create a person'
#     puts '4. Create a book'
#     puts '5. Create a rental'
#     puts '6. List rentals for a person'
#     puts '7. Quit'
#     puts '---------------------------'

#     option = gets.chomp.to_i

#     case option
#     when 1
#       @app.list_all_books
#     when 2
#       @app.list_people
#     when 3
#       @app.create_person
#     when 4
#       @app.create_book
#     when 5
#       @app.create_rental
#     when 6
#       @app.list_rentals_for_person
#     when 7
#       @app.end_app
#     else
#       puts 'Invalid option'
#       display_menu
#     end
#   end

#   def start
#     display_menu
#   end
# end

# Main.new.start
require_relative 'app'
require_relative 'menu'

class Main
  def initialize
    @app = App.new(self)
    @menu = Menu.new(self)
  end

  def start
    @menu.display_menu
  end

  def handle_option(option)
    case option
    when Menu::LIST_ALL_BOOKS
      @app.list_all_books
    when Menu::LIST_PEOPLE
      @app.list_people
    when Menu::CREATE_PERSON
      @app.create_person
    when Menu::CREATE_BOOK
      @app.create_book
    when Menu::CREATE_RENTAL
      @app.create_rental
    when Menu::LIST_RENTALS_FOR_PERSON
      @app.list_rentals_for_person
    when Menu::QUIT
      @app.end_app
    else
      puts 'Invalid option'
    end

    @menu.display_menu unless option == Menu::QUIT
  end

  def display_menu
    @menu.display_menu
  end
end

Main.new.start
