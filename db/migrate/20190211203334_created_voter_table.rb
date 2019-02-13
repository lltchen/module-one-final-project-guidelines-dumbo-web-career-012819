class CreatedVoterTable < ActiveRecord::Migration[5.0]
  def change
    create_table :voters do |t|
      t.string :name
      t.string :state
      t.string :party
      t.integer :age
      t.string :race
    end
  end
end
