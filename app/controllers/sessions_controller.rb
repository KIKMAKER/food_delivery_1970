require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    # ask for username
    username = @sessions_view.ask_for("username")
    # ask for password
    password = @sessions_view.ask_for("password")
    # find the employee by the username
    employee = @employee_repository.find_by_username(username)
    # p employee
    # check if the password matches
    if employee && employee.password == password
      # print success message
      @sessions_view.print_welcome_message(username)
      return employee
    else
      # print error message
      @sessions_view.print_wrong_credentials
      # try log in again
      login
    end
  end
end
