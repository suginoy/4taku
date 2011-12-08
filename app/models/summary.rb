class Summary < ActiveRecord::Base
  has_many :scores
 #has_many :users, :through => :scores
  belongs_to :users
  has_many :questions, :through => :scores

  def percentage
  return right.to_s + "/" + total.to_s
  end
end
