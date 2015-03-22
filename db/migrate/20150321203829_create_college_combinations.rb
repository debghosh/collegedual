class CreateCollegeCombinations < ActiveRecord::Migration
  def change
    create_table :college_combinations do |t|
      t.integer :primary_college_id
      t.integer :secondary_college_id
      t.timestamps
    end
  end
end
