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

  # Updates the value in db
  def update_value(aim,value)
    self.update("#{aim}": value)
  end



end
