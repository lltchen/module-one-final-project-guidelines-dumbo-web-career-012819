class Voter < ActiveRecord::Base
  has_many :ballots
  has_many :candidates, through: :ballots

  #Checks database to see if user was created
  def self.registered_yet(voter_name)
    Voter.find_by(name:voter_name)
  end

  # See all Party align Candidates
  def party_aligned_cand
      Candidate.all.select do |can|
        if can.party == self.party
          puts'==================================================='
          puts"                                                   "
          puts"                  #{can.name}                      "
          puts"                                                   "
          puts"               State: #{can.state}                 "
          puts"               Party: #{can.party}                 "
          puts"                 Age: #{can.age}                   "
          puts" Years of Experience: #{can.years_of_experience}   "
          puts" Level of Government: #{can.level_of_governments}  "
          puts"                                                   "
          puts'==================================================='
      end
    end
  end


  # See only Party align Candidates in Round #1
  def round1_my_party_cand
    Candidate.all.select do |can|
        if can.party == self.party and can.level_of_governments == "Local Election"
          puts''
          puts"                                                           "
          puts"                          #{can.name}                      "
          puts"                                                           "
          puts"                       State: #{can.state}                 "
          puts"                       Party: #{can.party}                 "
          puts"                         Age: #{can.age}                   "
          puts"         Years of Experience: #{can.years_of_experience}   "
          puts"         Level of Government: #{can.level_of_governments}  "
          puts"                                                           "
          puts'        ==================================================='
        end
    end
  end
  # See only Party align Candidates in Round #2
  def round2_my_party_cand
    Candidate.all.select do |can|
        if can.party == self.party and can.level_of_governments == "State Election"
          puts''
          puts"                                                           "
          puts"                          #{can.name}                      "
          puts"                                                           "
          puts"                       State: #{can.state}                 "
          puts"                       Party: #{can.party}                 "
          puts"                         Age: #{can.age}                   "
          puts"         Years of Experience: #{can.years_of_experience}   "
          puts"         Level of Government: #{can.level_of_governments}  "
          puts"                                                           "
          puts'        ==================================================='
        end
    end
  end
  # See only Party align Candidates in Round #3
  def round3_my_party_cand
    Candidate.all.select do |can|
        if can.party == self.party and can.level_of_governments == "National Election"
          puts''
          puts"                                                           "
          puts"                          #{can.name}                      "
          puts"                                                           "
          puts"                       State: #{can.state}                 "
          puts"                       Party: #{can.party}                 "
          puts"                         Age: #{can.age}                   "
          puts"         Years of Experience: #{can.years_of_experience}   "
          puts"         Level of Government: #{can.level_of_governments}  "
          puts"                                                           "
          puts'        ==================================================='
        end
    end
  end



  # See all Candidates in Round #1
  def round1_all_cand
    Candidate.all.select do |can|
        if can.level_of_governments == "Local Election"
          puts''
          puts"                                                           "
          puts"                          #{can.name}                      "
          puts"                                                           "
          puts"                       State: #{can.state}                 "
          puts"                       Party: #{can.party}                 "
          puts"                         Age: #{can.age}                   "
          puts"         Years of Experience: #{can.years_of_experience}   "
          puts"         Level of Government: #{can.level_of_governments}  "
          puts"                                                           "
          puts'        ==================================================='
        end
    end
  end
  # See all Candidates in Round #2
  def round2_all_cand
    Candidate.all.select do |can|
        if can.level_of_governments == "State Election"
          puts''
          puts"                                                           "
          puts"                          #{can.name}                      "
          puts"                                                           "
          puts"                       State: #{can.state}                 "
          puts"                       Party: #{can.party}                 "
          puts"                         Age: #{can.age}                   "
          puts"         Years of Experience: #{can.years_of_experience}   "
          puts"         Level of Government: #{can.level_of_governments}  "
          puts"                                                           "
          puts'        ==================================================='
        end
    end
  end
  # See all Candidates in Round #3
  def round3_all_cand
    Candidate.all.select do |can|
        if can.level_of_governments == "National Election"
          puts''
          puts"                                                           "
          puts"                          #{can.name}                      "
          puts"                                                           "
          puts"                       State: #{can.state}                 "
          puts"                       Party: #{can.party}                 "
          puts"                         Age: #{can.age}                   "
          puts"         Years of Experience: #{can.years_of_experience}   "
          puts"         Level of Government: #{can.level_of_governments}  "
          puts"                                                           "
          puts'        ==================================================='
        end
    end
  end

  #Finds a Voter's Ballots Instances
  def find_my_ballots
    my_ballots = Ballot.all.select do |ballo|
                 ballo.voter_id = self.id
                 end
    my_ballots.each do |ballo|
      puts" __________________________________________________________________ "
      puts"|                                                                  |"
      puts"|                           Round #1                               |"
      puts"|    #{Candidate.find(ballo.candidate_id)}    |"
      puts"|__________________________________________________________________|"
    end
  end

  # Updates the value in db
  def update_value(aim,value)
    self.update("#{aim}": value)
  end



end
