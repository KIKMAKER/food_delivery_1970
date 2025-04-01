class SessionsView
  def ask_for(stuff)
    puts "What is your #{stuff}?"
    print "> "
    return gets.chomp
  end

  def print_welcome_message(username)
    puts "Hello #{username}"
  end

  def print_wrong_credentials
    puts "Wrong credentials... Try again"
  end
end
