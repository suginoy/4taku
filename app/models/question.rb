class Question < ActiveRecord::Base
  default_scope order("id")
  scope :other_questions, lambda { |previous_id| where("id != ?", previous_id) }
end
