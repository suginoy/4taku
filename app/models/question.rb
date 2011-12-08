class Question < ActiveRecord::Base
  has_many :scores
  has_many :users, :through => :scores
  default_scope order("id")
  scope :other_questions, lambda { |previous_id| where("id != ?", previous_id) }
  def self.other_question(id)
    self.other_questions(id).sample
  end 
end
