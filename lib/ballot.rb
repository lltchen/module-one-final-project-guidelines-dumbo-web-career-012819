class Ballot < ActiveRecord::Base
    belongs_to :voter
    belongs_to :candidate




    def find_cand
      Candidate.find(self.candidate_id)
    end
end
