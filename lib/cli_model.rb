class CommandLineInterface
    def create_user
    puts 'Please enter a username to get started.'
    user_name = gets.chomp.capitalize
    usernames_arr = User.all.map {|user| user.name}
      if usernames_arr.include?(user_name)
        puts "                              "
        puts "Sorry, that username is taken."
        puts "_______________________"
        sleep(3)
        welcome
      end
    user = User.create(name: user_name)
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
      elsif join = UserLocation.create( name: user.name, user_id: user.id, location_id: @location.id)
        #find_location = Location.find_by(state: user_location)
          find_location = user.locations[0]
          puts find_location.coolfact
      end
      sleep(2)
      welcome
    end

  def update_user_location
    puts "Want to change your location and find some sustainable facts about that location?"
    puts 'Please enter your username to get started.'
    user_name = gets.chomp.capitalize
    user = User.all.find_by(name: user_name)
      if user == nil
        puts "Please create a profile"
        puts "_______________________"
        sleep(1)
        welcome
      else
        puts "Please enter your new location."
        new_location = gets.chomp
        capitalize = new_location.split.map(&:capitalize).join(' ')
        i = Location.all.find_by(state: capitalize)
          if i == nil
            puts "Sorry, we have no information for that location."
            welcome
            sleep(1)
          end
        new_location = UserLocation.find_by(user_id: user.id)
        new_location.update(location_id: i.id)
        puts "                             "
        puts new_location.location.coolfact
        puts "_______________________"
          sleep(3)
          welcome
      end
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

  def state_facts
    puts "Want to see all of the current facts for your state?"
    puts "Please enter your username to get started"
    name = gets.chomp.capitalize
    user_name = name
    user_inst = UserLocation.all.find { |instance| instance.name == user_name }
    facts_inst_arr =  user_inst.location.facts
    facts_inst_arr.map do |facts|
      puts "                      "
      puts facts.fact
      puts "_______________________"
      puts "                      "
    end
    sleep(3)
    welcome
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
    {"See All the Facts from Your State" => -> do state_facts end},
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
