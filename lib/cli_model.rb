class CommandLineInterface
    def create_user
    puts 'Please enter a username to get started.'
    user_name = gets.chomp
    usernames_arr = User.all.map {|user| user.name}
      if usernames_arr.include?(user_name)
        puts "Sorry, that username is taken."
        puts "Please enter a different username."
        user_name = gets.chomp
      end
    $user = User.create(name: user_name)
    system "clear"
    puts "Trying to educate yourself on how to be more sustainable in your state but not sure how to? We can help you with that!"
    sleep(1)
    puts "Enter the your state in which you reside to get started."
    user_location = gets.chomp
    capitalize = user_location.split.map(&:capitalize).join(' ')
    @location = Location.find_by(state: capitalize)
      system "clear"
      if @location == nil
          puts "Sorry, we have no information for that location."
      elsif join = UserLocation.create( name: $user.name, user_id: $user.id, location_id: @location.id)
        #find_location = Location.find_by(state: user_location)
          find_location = $user.locations[0]
          puts find_location.coolfact
      end
      sleep(2)
      welcome
    end

  def update_user_location
    puts "Want to change your location and find some sustainable facts about that location?"
    puts 'Please enter your username to get started.'
    user_name = gets.chomp
    $user = User.create(name: user_name)
    system "clear"
    puts "Please enter your new location."
    new_location = gets.chomp
    capitalize = new_location.split.map(&:capitalize).join(' ')
    @new_location = Location.find_by(state: capitalize)
      if @new_location == nil
        puts "Sorry, we have no information for that location."
      elsif join = UserLocation.create(name: $user.name, user_id: $user.id, location_id: @new_location.id)
      #find_location = Location.find_by(state: user_location)
        find_location = $user.locations[0]
        puts find_location.coolfact
      end
      sleep(2)
      welcome
  end

  def delete_file
    user = User.all.map {|user| user.name}
    prompt = TTY::Prompt.new
    choice = prompt.select("Which file do you want to delete?", user)
    delete = User.all.find { |username|  username.name == choice}
    delete.destroy
    puts "Your file has been deleted."
    sleep(2)
    welcome
  end

  def current_facts
    puts "Want to see your current facts?"
    puts "Please enter your username to get started"
    user_name = gets.chomp
    user_inst = UserLocation.all.find { |username|  username.name == user_name}
    binding.pry
    puts user_inst.location.facts.map {|facts| facts.fact}

  end

  def goodbye
    puts "Goodbye"
    system "clear"
  end

  def banner
      puts "
      ____            _        _             _     _
     / ___| _   _ ___| |_ __ _(_)_ __   __ _| |__ | | ___
     \\___ \\| | | / __| __/ _` | | '_ \\ / _` | '_ \\| |/ _ \\
      ___) | |_| \\__ \\ || (_| | | | | | (_| | |_) | |  __/
     |____/ \\__,_|___/\\__\\__,_|_|_| |_|\\__,_|_.__/|_|\\___|
     "
  end

  def welcome
    main_menu = [{"Create A Profile" => -> do create_user end},
    {"Update Your Location" => -> do update_user_location end},
    {"See Your Current Facts" => -> do current_facts end},
    {"Delete Your Profile" => -> do delete_file end},
    {"Exit" => -> do goodbye end}]
    prompt = TTY::Prompt.new
    response = prompt.select("Welcome to Sustainable!", main_menu)
  end

  def run
    banner
    puts 'Welcome to Sustainable, the best resource for Sustainable information in the world!'
    welcome
  end

end
