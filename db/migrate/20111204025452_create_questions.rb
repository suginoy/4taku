class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :number
      t.string :title
      t.text :description
      t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
      t.integer :answer
      t.text :explanation

      t.timestamps
    end
  end
end
