class AddSummaryIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :summary_id, :integer
    add_index :scores, :summary_id
  end

end
