require 'restaurant'

class Guide
  class Config
    @@actions = ['list', 'find', 'add', 'quit']
    def self.actions; @@actions; end
  end
  
  def initialize (path=nil)
    #locate restaurant text file or create new
    Restaurant.filepath = path
    if Restaurant.file_exists?
      puts "Found restaurant file."
    #create new
    elsif Restaurant.create_file
      puts "Created restaurant file."
    else
      puts "Exiting."
      exit!
    end
  end

  def launch!
    #introduction and escort user (action loop, what do you want to do, do the action, repeat until user quits
    introduction
    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
    conclusion
  end
  
  def get_action
    action = nil
    # Asks for user input until we get a valid one
    until Guide::Config.actions.include?(action)
      puts "Actions:  " + Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action 
  end
  
  def do_action(action)
    case action
    when 'list'
      list
    when 'find'
      puts "Finding..."
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "\nI don't underestand taht command. \n"
    end
  end
  
  def add
    puts "\n Add a restaurant\n\n".upcase
    restaurant = Restaurant.new
    print "Restaurant name: "
    restaurant.name = gets.chomp.strip
    print "Cuisine type: "
    restaurant.cuisine = gets.chomp.strip
    print "Average price: "
    restaurant.price = gets.chomp.strip
    
    if restaurant.save
      puts "\nRestaurant added\n\n"
    else
      puts "\nNot saved!!\n****************"
    end
  end
  
  #listing
  def list
        puts "\n listing restaurants\n\n".upcase
        restaurants = Restaurant.saved_restaurants
        restaurants.each do |rest|
          puts rest.name + " | " + rest.cuisine + " | " + rest.price
        end
  end
  
  def introduction
  puts "\n\n<<< Welcome to the food finder >>>\n\n"
  puts "This is an interactive guide to help you find the food you crave\n\n"
  end
  
  def conclusion
    puts "\n<<< Goodbye, come back again :D >>>\n\n\n"
  end
  
 end