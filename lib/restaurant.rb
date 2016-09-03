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
    # read the restaurant file
    # return instances of restaurant
  end
    
  def save
      return false unless Restaurant.file_exists?
      File.open(@@filepath, 'a') do |file|
        file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
      return true
      end
  end
  
  
  
end