class CreatedCandidateTable < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :state
      t.string :party
      t.integer :age
      t.string :years_of_experience
      t.string :level_of_governments
    end
  end
end
