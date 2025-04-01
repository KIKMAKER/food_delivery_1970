require 'csv'

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @customers
  end

  def create(customer)
    customer.id = @next_id
    # @next_id = @next_id + 1
    @customers << customer
    @next_id += 1
    # puts "saving"
    save_csv
  end

  def find(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
    @next_id = @customers.any? ? @customers.last.id + 1 : 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
        # puts "adding #{customer.name} added"
      end
    end
  end
end
