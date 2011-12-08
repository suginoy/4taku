class AddUserIdAndQuestionIdToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :user_id, :integer
    add_column :summaries, :question_id, :integer
    add_index :summaries, :user_id
    add_index :summaries, :question_id
  end
end
