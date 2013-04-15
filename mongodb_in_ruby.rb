# The objective of this program is to create mongoDB-like file with CRUD functionalities
# To start the program type "ruby mongodb_in_ruby.rb"
# The program will only interact as a single database with different collections
# The program starts with a collection ('test')

# Relationship SQL with Mongo:
# database  =>  database
# table     =>  collection
# row       =>  document

# Possible commands to type on the terminal:

# exit                              // exits program

# show                              // shows all the collections in database
# collection                        // shows the current collection
# new_collection(<collection>)      // creates a new collection in the database
# switch_to(<collection>)           // <collection> is the new current_collection

# insert(<key>, <values>)           // Create .Writes a document in the current collection with key <key> and value <values>
# find(<key>)                       // Read .Reads the current collection if no <key> is given, otherwise outputs the document with key <key>
# update(<key>, <new_document>)     // Update. Updates the document with key <key> in current collection. Or creates a new document if there is no document with key <key>
# delete(<key>)                     // Delete. Deletes the current collection if no <key> is given, otherwise, deletes the document with key <key>




class MongoDatabase
    attr_accessor :collections, :current_collection

  def initialize
    @collections = {'test'=>{}}
    @@current_collection = 'test'
  end

  # methods related with the different collections in our database

  def show # shows all the collections in the database
    puts "> These are all the collections in the database:"
    @collections.keys.each {|collection| puts ">> #{collection}"}
  end

  def collection # shows the current collection
    puts "> current_collection: #{@@current_collection}"
  end

  def new_collection(arg) # takes a String as arg and creates a new collection with name arg.
    @@current_collection = arg
    @collections[arg]={}
    puts "> current collection: #{arg}"
  end

  def switch_to(arg) # takes a String as arg and switches the current collection to arg
    if collections.include?(arg)
      @@current_collection = arg
      collection
    else
      puts "Sorry, that collection is not in this program"
      collection
    end
  end

  # methods related with the documents in the current collection

  def insert(key, *values) # Create(write) a document in the current collection with key <key> and value <values>
    @collections[@@current_collection][key] = values[0] if values.length == 1
    @collections[@@current_collection][key] = values if values.length > 1
    puts "> #{@collections[@@current_collection]}"
  end

  def find(arg='') # Read(display). If arg is '', displays the collection. If arg given, displays the document in current collection
    return find_all_documents if arg == ''
    find_document(arg)
  end

  def update(key, new_value) # Updates the value of the document with key <key>. If no document with key <key> creates a new one.
    collections[@@current_collection][key] = new_value
    find
  end

  def delete(arg='') # Delete. If arg is '', current collection is deleted from the database. Otherwise it deletes the document with key <arg> in current collection
    return delete_collection if arg == ''
    delete_document(arg)
  end


  # _____________ Private methods _______________ #
  private

  def find_all_documents
    puts "collection: #{@@current_collection}"
    puts "> #{@collections[@@current_collection]}"
  end

  def find_document(arg)
    if @collections[@@current_collection].keys.include?(arg)
      puts "#{arg} => #{@collections[@@current_collection][arg]}"
   else
      puts "#{arg} is not a key in the current collection"
   end
  end

  def delete_collection
    @collections.delete(@@current_collection)
    if @collections.keys == []
      $command = 'exit'
      puts "> There are no collections in the database, please restart the program"
    else
      @@current_collection = @collections.keys[0]
      show
      collection
    end
  end

  def delete_document(arg)
    @collections[@@current_collection].delete(arg)
    find
  end


  # _______  method to run the program ______#

  public

  def run
    while $command != 'exit'
      $command = gets.chomp
      return if $command =='exit'
      unless self.methods.include?($command.scan(/\w*/)[0].to_sym)
        puts "> Please insert a valid command"
      else
        eval("self.#{$command}")
      end
    end
  end



end

#  _____DRIVER CODE _________

$command = ''
collection = MongoDatabase.new
collection.run



