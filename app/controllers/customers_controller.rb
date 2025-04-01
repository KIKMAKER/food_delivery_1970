require_relative '../views/customer_view'
require_relative '../models/customer'
class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def add
    # get the customer name
    name = @customer_view.ask_for_name
    # get the customer address
    address = @customer_view.ask_for_address
    # make an instance of customer
    customer = Customer.new(name: name, address: address)
    # send it to the db
    @customer_repository.create(customer)
  end

  def list
    # get all the customers fromt he db
    customers = @customer_repository.all
    # display them in the view
    @customer_view.display_list(customers)
  end
end
