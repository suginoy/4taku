class AddCounterCacheToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :questions_count, :integer, :null => false, :default => 0
  end
end
