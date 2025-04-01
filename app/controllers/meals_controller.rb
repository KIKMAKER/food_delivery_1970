require_relative '../views/meal_view'
require_relative '../models/meal'
class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def add
    # get the meal name
    name = @meal_view.ask_for_name
    # get the meal price
    price = @meal_view.ask_for_price
    # make an instance of meal
    meal = Meal.new(name: name, price: price)
    # send it to the db
    @meal_repository.create(meal)
  end

  def list
    # get all the meals fromt he db
    meals = @meal_repository.all
    # display them in the view
    @meal_view.display_list(meals)
  end
end
