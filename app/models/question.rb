class Question < ActiveRecord::Base
  before_validation :fill_number
  after_destroy :compact_number
  belongs_to :course, :counter_cache => true
  has_many :scores
  has_many :users, :through => :scores

  validates :number, :numericality => { :greater_than_or_equal_to => 1 }
  validates :title, :description, :choice1, :choice2, :choice3, :choice4, :explanation, :presence => true
  validates :answer, :inclusion => { :in => [1, 2, 3, 4] }

  default_scope order("number")

  def next
    unless self.number == self.course.questions.length
     Question.find_by_course_id_and_number(self.course_id, self.number + 1)
    end
  end

  def compact_number
    Question.where(:course_id => self.course_id).each do |question|
      if question.number > self.number
        question.update_attribute(:number, question.number - 1)
      end
    end
  end

  private
    def fill_number
      self.number ||= self.course.questions_count + 1
    end
end
