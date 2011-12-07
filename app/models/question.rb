class Question < ActiveRecord::Base
  default_scope order("id")
  scope :other_questions, lambda { |previous_id| where("id != ?", previous_id) }
  scope :other, lambda { |previous_id| where("id != ?", previous_id) }
  def self.other_question(id)
    self.other_questions(id).sample
  end 
end
