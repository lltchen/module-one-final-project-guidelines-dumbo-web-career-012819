class CreatedBallotTable < ActiveRecord::Migration[5.0]
  def change
    create_table :ballots do |t|
      t.integer :voter_id
      t.integer :candidate_id

    end
  end
end
