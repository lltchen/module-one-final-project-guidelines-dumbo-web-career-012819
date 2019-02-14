class UserStories

  def self.intro
    Screen.clear
      ################################################################################
      ################################ INTRODUCTIONS #################################
      ################################################################################
      puts" __________________________________________________________________"
      puts"|                                                                  |"
      puts"|         ___             __         ___ ___       __              |"
      puts"|        |   .-----.-----|  |_.---.-|   Y   .-----|  |_.-----.     |"
      puts"|        |.  |     |__ --|   _|  _  |.  |   |  _  |   _|  -__|     |"
      puts"|        |.  |__|__|_____|____|___._|.  |   |_____|____|_____|     |"
      puts"|        |:  |                      |:  |   |                      |"
      puts"|        |::.|                      `.:.. ./                       |"
      puts"|        `---'                        `---'                        |"
      puts"|                                                                  |"
      puts"|__________________________________________________________________|"
      puts"|                                                                  |"
      puts"|                 Hello and Welcome to InstaVote!!!                |"
      puts"|__________________________________________________________________|"
      puts'|                                                                  |'
      puts"|                                                                  |"
      puts"|                  InstaVote Is A CLI Election App                 |"
      puts"|                Designed To Allow a User to Vote In               |"
      puts"|                Local, State and National Elections               |"
      puts"|                 Or Run As a Candidate For Office.                |"
      puts"|                                                                  |"
      puts"|__________________________________________________________________|"
      gets.chomp
      ################################################################################
      ################################ INTRODUCTIONS #################################
      ################################     (END)     #################################
      ################################################################################
      #Clears the terminal
      Screen.clear
      self.voter_or_candidate?
  end
  def self.voter_or_candidate?
    ################################################################################
    ############################ VOTER OR A CANDIDATE? #############################
    ################################################################################
        puts" __________________________________________________________________ "
        puts'|                                                                  |'
        puts"|                         First Thing First                        |"
        puts"|                                                                  |"
        puts"|          Would Like To Play As A Voter Or A Candidate?           |"
        puts"|                                                                  |"
        puts"|__________________________________________________________________|"

        mode = gets.chomp.capitalize
        puts" __________________________________________________________________ "
        puts'|                                                                  |'
        puts"|              Have You Registered For This App Before?            |"
        puts"|                            (Yes or No)                           |"
        puts"|__________________________________________________________________|"
        regist = gets.chomp
         if regist.start_with?("y","Y")
           Screen.clear
           self.find_profile
         end
        puts" __________________________________________________________________ "
        puts"|                                                                  |"
        puts"|         Great!!! Now That You Selected To Be A #{mode},          |"
        puts"|              Please Complete The Registration Below.             |"
        puts"|__________________________________________________________________|"
        gets.chomp
        Screen.clear
        # The code below routes the user to the correct registration based on the user's responce above.
          if mode === 'Voter'
            self.voter_registration
          elsif mode == 'Candidate'
            self.candidate_registration
          end
    ################################################################################
    ############################ VOTER OR A CANDIDATE? #############################
    ############################         (END)         #############################
    ################################################################################
  end


  def self.voter_registration
    ################################################################################
    ###############################  Registration  #################################
    ################################################################################
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                        Voter Registration                        |"
    puts"|__________________________________________________________________|"
    gets.chomp
    Screen.clear
    puts" __________________________________________________________________"
    puts"|                                                                  |"
    puts"|                        What Is Your Name?                        |"
    puts"|__________________________________________________________________|"

    #Name of User
    my_name = gets.chomp

    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                    What State Do You Live In?                    |"
    puts"|__________________________________________________________________|"

    #State of User
    my_state = gets.chomp

    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                  What Party Do You Identify As?                  |"
    puts"|__________________________________________________________________|"

    #Party of User
    my_party = gets.chomp

    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                         How Old Are You?                         |"
    puts"|__________________________________________________________________|"

    #Age of User
    my_age = gets.chomp

    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                  What Race Do You Identify As?                   |"
    puts"|__________________________________________________________________|"

    #Race of User
    my_race = gets.chomp
    #New Voter Instance is Created.
    @voter1 = Voter.create(name:my_name,state:my_state,party:my_party,age:my_age,race:my_race)
    Screen.clear
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                            Great!!!                              |"
    puts"|       Now That You Entered In Your Registration Infomation,      |"
    puts"|          Please Confirm That The Info Below Is Correct.          |"
    puts"|__________________________________________________________________|"
    gets.chomp
    puts" __________________________________________________________________ "
    puts"                                                                  "
    puts"                          Your Profile                         "
    puts"                                                                  "
    puts"                           #{my_name}                            "
    puts"                                                                  "
    puts"                        State: #{my_state}                        "
    puts"                        Party: #{my_party}                        "
    puts"                          Age: #{my_age}                          "
    puts"                         Race: #{my_race}                         "
    puts"                                                                  "
    puts"                                                                  "
    puts"                           (Yes or No)                               "
    puts"__________________________________________________________________"
    needs_update = gets.chomp

    #The code below routes user to update prompt.
     if needs_update.start_with?("n","N")
       Screen.clear
       self.update_prompt
     end
    ################################################################################
    ###############################  Registration  #################################
    ###############################      (END)     #################################
    ################################################################################
  end

  def self.update_prompt
    ################################################################################
    ###############################     Update     #################################
    ################################################################################
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                    Updating Your Informaton                      |"
    puts"|__________________________________________________________________|"
    gets.chomp
    # binding.pry
    puts" __________________________________________________________________ "
    puts"                                                                  "
    puts"                             Your Profile                         "
    puts"                                                                  "
    puts"                            #{@voter1.name}                            "
    puts"                                                                  "
    puts"                        State: #{@voter1.state}                        "
    puts"                        Party: #{@voter1.party}                        "
    puts"                          Age: #{@voter1.age}                        "
    puts"                         Race: #{@voter1.race}                        "
    puts"                                                                  "
    puts" __________________________________________________________________"
    gets.chomp
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|             What Informaton Would You Like To Update?            |"
    puts"|                    (Ex. State, Age, Race,...)                    |"
    puts"|__________________________________________________________________|"
    attr = gets.chomp.downcase
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|             What Would You Like The New Value To Be?             |"
    puts"|                    (Ex. NYC, 101, Alien,...)                     |"
    puts"|__________________________________________________________________|"
    value = gets.chomp
    @voter1.update_value(attr,value)
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|     Awesome,We Have Just Updated Your Informaton And Your        |"
    puts"|                     #{attr} Is Now #{value}                      |"
    puts"|__________________________________________________________________|"
    puts" __________________________________________________________________ "
    puts"                                                                  "
    puts"                            #{@voter1.name}                            "
    puts"                                                                  "
    puts"                        State: #{@voter1.state}                        "
    puts"                        Party: #{@voter1.party}                        "
    puts"                          Age: #{@voter1.age}                        "
    puts"                         Race: #{@voter1.race}                        "
    puts"                                                                  "
    puts"__________________________________________________________________"
    ################################################################################
    ###############################     Update     #################################
    ###############################     (END)      #################################
    ################################################################################

  end

  def self.find_profile
    puts" __________________________________________________________________ "
    puts'|                                                                  |'
    puts"|              Please Enter the Name You User to Registered        |"
    puts"|                         The First Time.                          |"
    puts"|__________________________________________________________________|"
    name = gets.chomp
    @voter1 = Voter.registered_yet(name)
    binding.pry
    puts" __________________________________________________________________ "
    puts'|                                                                  |'
    puts"|                    Welcome Back #{@voter1.name}                  |"
    puts"|__________________________________________________________________|"
  end











  def voting_instruction
    ################################################################################
    ###############################  Instructions  #################################
    ################################################################################
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                              Awesome!!!                          |"
    puts"|          You Have Just Finished the Registration Process!        |"
    puts"|                 Please Confirm That It Is Correct.               |"
    puts"|__________________________________________________________________|"
    gets.chomp
    puts" __________________________________________________________________ "
    puts"                                                                  "
    puts"                            #{my_name}                            "
    puts"                                                                  "
    puts"                        State: #{my_state}                        "
    puts"                        Party: #{my_party}                        "
    puts"                          Age: #{my_age}                          "
    puts"                         Race: #{my_race}                         "
    puts"                                                                  "
    puts"__________________________________________________________________"
    ################################################################################
    ###############################  Instructions  #################################
    ###############################     (END)      #################################
    ################################################################################
  end
  def self.candidate_registration

  end
end
