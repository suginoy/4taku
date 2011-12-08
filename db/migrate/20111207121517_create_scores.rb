class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :user
      t.references :question
      t.integer :user_answer
      t.boolean :correct
      t.date :answer_date

      t.timestamps
    end
    add_index :scores, :user_id
    add_index :scores, :question_id
  end
end
