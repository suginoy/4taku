class Course < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User', :dependent => :delete
  has_many :questions

  validates :name, :presence => true
  validates :description, :presence => true

  scope :shared, where(:sharing => true)
  scope :shared_courses_for, lambda { |user| shared.where 'owner_id != ?', user[:id] }
end
