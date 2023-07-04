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
      @app.save_data_to_json
      @app.end_app
    else
      puts 'Invalid option'
    end

    return unless option != Menu::QUIT

    @menu.display_menu
  end

  def display_menu
    @menu.display_menu
  end
end

Main.new.start
