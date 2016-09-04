class Restaurant
  
  @@filepath = nil
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end
  
  attr_accessor :name, :cuisine, :price
  
  def self.file_exists?
    # to know if the file exists
    if @@filepath && File.exists?(@@filepath)
      return true
    else
      return false
     end
   end
  
  
  def self.create_file
    # create the restaurant file
    File.open(@@filepath, 'w') unless file_exists?
      return file_exists?
  end
  
  def self.saved_restaurants
    restaurants = []
    if file_exists?
      file = File.new(@@filepath, 'r')
      file.each_line do |line|
        restaurants << Restaurant.new.import_line(line.chomp)
      end
      file.close
    end
    return restaurants
  end
  
  def initialize(args = {})
      #If we don't get name, we will set the value to ""
    @name = args[:name]       ||    ""
    @cuisine = args [:cuisine] ||    ""
    @price = args [:price]        ||    ""
  end
  
  def import_line (line)
    line_array = line.split("\t")
    @name, @cuisine, @price = line_array
    return self
  end
  
  def save
      return false unless Restaurant.file_exists?
      File.open(@@filepath, 'a') do |file|
        file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
      return true
      end
  end
  
  
  
end