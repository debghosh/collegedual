class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :college_combination_id
      t.string :question_name
      t.timestamps
    end
  end
end
