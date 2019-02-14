class Candidate < ActiveRecord::Base
  has_many :ballots
  has_many :voters, through: :ballots
# See all Candidates
  def self.all_candidates
    Candidate.all.each do |can|
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
  def self.my_party_cand
    Candidate.all.select do |can|
        if can.party == $voter1.party and can.level_of_governments == "Local Election"
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


end
