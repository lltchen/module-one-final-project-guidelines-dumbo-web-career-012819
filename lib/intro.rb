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
         else
           puts" __________________________________________________________________ "
           puts"|                                                                  |"
           puts"|         Great!!! Now That You Selected To Be A #{mode},          |"
           puts"|                     Lets Get You Registered.                     |"
           puts"|__________________________________________________________________|"
           gets.chomp
           Screen.clear
           # The code below routes the user to the correct registration based on the user's responce above.
             if mode === 'Voter'
               self.voter_registration
             elsif mode == 'Candidate'
               self.candidate_registration
             end
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
    $voter1 = Voter.create(name:my_name,state:my_state,party:my_party,age:my_age,race:my_race)
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
     else
       Screen.clear
       self.voting_instruction
     end
    ################################################################################
    ###############################  Registration  #################################
    ###############################      (END)     #################################
    ################################################################################
  end

  def self.candidate_registration

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
    puts"                            #{$voter1.name}                            "
    puts"                                                                  "
    puts"                        State: #{$voter1.state}                        "
    puts"                        Party: #{$voter1.party}                        "
    puts"                          Age: #{$voter1.age}                        "
    puts"                         Race: #{$voter1.race}                        "
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
    $voter1.update_value(attr,value)
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|     Awesome,We Have Just Updated Your Informaton And Your        |"
    puts"|                     #{attr.capitalize} Is Now #{value}                      |"
    puts"|__________________________________________________________________|"
    puts" __________________________________________________________________ "
    puts"                                                                  "
    puts"                            #{$voter1.name}                            "
    puts"                                                                  "
    puts"                        State: #{$voter1.state}                        "
    puts"                        Party: #{$voter1.party}                        "
    puts"                          Age: #{$voter1.age}                        "
    puts"                         Race: #{$voter1.race}                        "
    puts"                                                                  "
    puts"__________________________________________________________________"
    gets.chomp
    Screen.clear
    self.voting_instruction
    ################################################################################
    ###############################     Update     #################################
    ###############################     (END)      #################################
    ################################################################################

  end

  def self.find_profile
    puts" __________________________________________________________________ "
    puts'|                                                                  |'
    puts"|              Please Enter the Name You Used to Registered        |"
    puts"|                         The First Time.                          |"
    puts"|__________________________________________________________________|"
    name = gets.chomp
    $voter1 = Voter.registered_yet(name)
    # binding.pry
    puts" __________________________________________________________________ "
    puts'|                                                                  |'
    puts"|                    Welcome Back #{$voter1.name}                  |"
    puts"|__________________________________________________________________|"
    gets.chomp
    Screen.clear
    self.voting_instruction
  end

  def self.voting_instruction
    ################################################################################
    ###############################  Instructions  #################################
    ################################################################################
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                             Awesome!!!                           |"
    puts"|      Now That Your Done With That, Lets Dive Right Into It.      |"
    puts"|__________________________________________________________________|"
    gets.chomp
    Screen.clear
    puts" __________________________________________________________________ "
    puts"                                                                  "
    puts"                       VOTING  INSTRUCTIONS                         "
    puts"                                                                  "
    puts"       Today you will have the chance to vote in three rounds         "
    puts"       of elections(Local,State & Federal). During each round,   "
    puts"       you will be able to see all of the candidate that have      "
    puts"       registered for that perticular election along with their "
    puts"       credentials.                                              "
    puts''
    puts"       Once you have finished analyzing the candidates, please"
    puts"       enter in the name of the candidate you wish to vote"
    puts"       for. Once you have done this for all three rounds, you "
    puts"       be able to see the results of each election."
    puts""
    puts"                             NOTE:"
    puts"       During each round you will also have the option to just     "
    puts"       veiw candidates that are in you party.                                                                 "
    puts"__________________________________________________________________"
    gets.chomp
    Screen.clear
    puts"`__________________________________________________________________"
    puts"|                                                                  |"
    puts"|            (Are You Ready To Make America Great Again?)          |"
    puts"|__________________________________________________________________|"
    gets.chomp
    puts"`__________________________________________________________________"
    puts"|                                                                  |"
    puts"|                       (Let The Games Begin)                      |"
    puts"|__________________________________________________________________|"
    gets.chomp
    Screen.clear
    self.round1
    ################################################################################
    ###############################  Instructions  #################################
    ###############################     (END)      #################################
    ################################################################################
  end

  def self.round1
          puts" __________________________________________________________________ "
          puts"|                                                                  |"
          puts"|                           Round #1                               |"
          puts"|                       Mayoral Elections                          |"
          puts"|__________________________________________________________________|"
          gets.chomp
          puts" __________________________________________________________________ "
          puts"|                                                                  |"
          puts"|                   Would You Like To See Only The                 |"
          puts"|                      Candidates in Your Party?                   |"
          puts"|                           (Yes of No)                            |"
          puts"|__________________________________________________________________|"
          just_party = gets.chomp
          if just_party.start_with?("y","Y")
            $voter1.round1_my_party_cand
          else
             $voter1.round1_all_cand
          end
          round1_vote = gets.chomp
          round1_vote = Candidate.find_by(name:round1_vote)
          Ballot.create(voter_id: $voter1.id,candidate_id:round1_vote.id)
          Screen.clear
          self.round2
  end
  def self.round2
          puts" __________________________________________________________________ "
          puts"|                                                                  |"
          puts"|                             Round #2                             |"
          puts"|                         Mayoral Elections                        |"
          puts"|__________________________________________________________________|"
          gets.chomp
          puts" __________________________________________________________________ "
          puts"|                                                                  |"
          puts"|                   Would You Like To See Only The                 |"
          puts"|                     Candidates in Your Party?                    |"
          puts"|                           (Yes of No)                            |"
          puts"|__________________________________________________________________|"
          just_party = gets.chomp
          if just_party.start_with?("y","Y")
            $voter1.round2_my_party_cand
          else
             $voter1.round2_all_cand
          end
          round2_vote = gets.chomp
          round2_vote = Candidate.find_by(name:round2_vote)
          Ballot.create(voter_id: $voter1.id,candidate_id:round2_vote.id)
          Screen.clear
          self.round3
  end
  def self.round3
          puts" __________________________________________________________________ "
          puts"|                                                                  |"
          puts"|                             Round #3                             |"
          puts"|                       Presidential Elections                     |"
          puts"|__________________________________________________________________|"
          gets.chomp
          puts" __________________________________________________________________ "
          puts"|                                                                  |"
          puts"|                   Would You Like To See Only The                 |"
          puts"|                      Candidates in Your Party?                   |"
          puts"|                            (Yes of No)                           |"
          puts"|__________________________________________________________________|"
          just_party = gets.chomp
          if just_party.start_with?("y","Y")
            $voter1.round3_my_party_cand
          else
             $voter1.round3_all_cand
          end
          round3_vote = gets.chomp
          round3_vote = Candidate.find_by(name:round3_vote)
          Ballot.create(voter_id: $voter1.id, candidate_id:round3_vote.id)
          Screen.clear
          puts" __________________________________________________________________ "
          puts"|                                                                  |"
          puts"|                             Congrates!!!                         |"
          puts"|   You Have Just Completed The Last Round Of The 2018 Elections.  |"
          puts"|__________________________________________________________________|"
          gets.chomp
          puts" __________________________________________________________________ "
          puts"|                                                                  |"
          puts"|                   Gets What? The Results Are In!!!               |"
          puts"|__________________________________________________________________|"
          Screen.clear
          self.election_results
  end
  def self.election_results
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|                           Elections Results                      |"
    puts"|__________________________________________________________________|"
    gets.chomp
    Candidate.total_vote_count
    gets.chomp
    Screen.clear
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|          Below are the Candidates You Voted In Each Round.       |"
    puts"|__________________________________________________________________|"
    gets.chomp
    $voter1.find_my_ballots
    gets.chomp
    puts" __________________________________________________________________ "
    puts"|                                                                  |"
    puts"|    After Seeing The Results Of Election, Would Like A Do Over?   |"
    puts"|__________________________________________________________________|"
    do_over = gets.chomp
    if do_over.start_with?("Y","y")
      $voter.delete_ballots
      puts" __________________________________________________________________ "
      puts"|                                                                  |"
      puts"|                Your Right, Second Time's The Charm               |"
      puts"|__________________________________________________________________|"
      gets.chomp
      Screen.clear
      self.round1
    else
      puts" __________________________________________________________________ "
      puts"|                                                                  |"
      puts"|                             Congrates!!!                         |"
      puts"|   You Have Just Completed The Last Round Of The 2018 Elections.  |"
      puts"|__________________________________________________________________|"
      gets.chomp
      Screen.clear
    end
  end
end
