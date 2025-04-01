# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to Kiki's Delivery Service"
    while @running
      display_menu
      user_action = gets.chomp.to_i
      route_action(user_action)
    end
  end


  def display_menu
    puts "What would you like to do:"
    puts "1 - add a meal"
    puts "2 - list all meal"
    puts "3 - add a customer"
    puts "4 - list all customers"
    puts "9 - quit"
  end

  def route_action(user_action)
    case user_action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then quit
    else
      puts "not an option"
    end
  end

  def quit
    puts "good bye!"
    @running = false
  end
end
