class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :summary
end
