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
  def self.total_vote_count
    Candidate.all.each do |can|
      puts'==================================================='
      puts"                                                   "
      puts"                  #{can.name}                      "
      puts"                                                   "
      puts"    Total # of Votes: #{can.my_vote_count}                 "
      puts'==================================================='
    end
  end

  def my_vote_count
    self.ballots.count
  end

  def my_voter_demo

  end


end
