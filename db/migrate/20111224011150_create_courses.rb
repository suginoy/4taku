class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :owner_id

      t.timestamps
    end
    add_index :courses, :owner_id
  end
end
