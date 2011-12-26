class AddSharingToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :sharing, :boolean
  end
end
