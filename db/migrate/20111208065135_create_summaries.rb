class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.integer :total
      t.integer :right

      t.timestamps
    end
  end
end
