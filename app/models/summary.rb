class Summary < ActiveRecord::Base
  has_many :scores
 #has_many :users, :through => :scores
  belongs_to :users
  has_many :questions, :through => :scores

  default_scope order("total, right, question_id")

  def self.least_answered(user_id)
    Summary.where(:user_id => user_id)[0]
  end 

  def percentage
    total == 0 ? "0" : sprintf( "%2d", right.to_f * 100 / total)
  end

end
